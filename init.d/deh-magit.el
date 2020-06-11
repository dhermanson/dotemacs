(require 'magit)

;; (setq magit-ediff-dwim-show-on-hunks t)
(setq magit-ediff-dwim-show-on-hunks nil)
(setq magit-log-margin '(t "%Y-%m-%d %l:%M %p " magit-log-margin-width t 18))

(defun deh-magit-mode-hook ()
  "my magit mode hook"
  ;; (setq display-line-numbers 'relative)
  )

(defun deh-magit-rev-mode-hook ()
  "my magit-rev-mode hook"
  ;; (magit-section-show-level-1-all)
  )

(add-hook 'magit-mode-hook 'deh-magit-mode-hook)
(add-hook 'magit-revision-mode-hook 'deh-magit-rev-mode-hook)


(defun deh/advice/clear-magit-revision-history (orig-fun &rest args)
;; I don't like the history checkout showing before the dwim
  (progn
    ;; (with-current-buffer (current-buffer)
      (setq magit-revision-history nil)
      (apply orig-fun args))
    ;; )
  )

;; (advice-add 'magit-branch-checkout :around #'deh/advice/clear-magit-revision-history)
(advice-add 'magit-branch :around #'deh/advice/clear-magit-revision-history)


(provide 'deh-magit)
