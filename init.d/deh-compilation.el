(require 'ansi-color)

(defun deh-ansi-colorize-buffer ()
  (let ((buffer-read-only nil))
    (ansi-color-apply-on-region (point-min) (point-max))))

(add-hook 'compilation-filter-hook 'deh-ansi-colorize-buffer)

;; (add-to-list 'auto-mode-alist '("\\.compilation\\.*" . compilation-mode))
(add-to-list 'auto-mode-alist '("\\.grep.result$" . grep-mode))
;; (setq auto-mode-alist nil)


(defun deh/advice/save-window-excursion (orig-fun &rest args)
  (with-current-buffer (current-buffer)
    (save-window-excursion
      (apply orig-fun args))))

(advice-add 'recompile :around #'deh/advice/save-window-excursion)

(defun deh/hooks/compilation-mode-hook ()
  (setq truncate-lines nil)
  ;; (setq truncate-lines t)
  )

(add-hook 'compilation-mode-hook 'deh/hooks/compilation-mode-hook)


(provide 'deh-compilation)
