;; (require 'all-the-icons-dired)
(require 'dired-subtree)

(setq dired-dwim-target t) ;; press C to copy to other dir

;; https://www.emacswiki.org/emacs/DiredOmitMode
(require 'dired-x)
(setq-default dired-omit-files-p t) ; Buffer-local variable
(setq dired-omit-files (concat dired-omit-files "\\|^\\..+$"))

(defun deh/dired-mode-hook ()
  "My dired mode hook."

  (put 'dired-find-alternate-file 'disabled nil)
  (dired-hide-details-mode t)
  ;; (dired-hide-details-mode nil)
  )

(define-key dired-mode-map (kbd "TAB") 'dired-subtree-toggle)
(define-key dired-mode-map (kbd "-") 'dired-up-directory)
(add-hook 'dired-mode-hook 'deh/dired-mode-hook)

;; (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;; https://emacs.stackexchange.com/questions/35536/dired-mouse-click-open-folder-in-the-same-window
;; this makes dired open folder in same window when mouse clicking
;; (define-key dired-mode-map [mouse-2] 'dired-mouse-find-file) 

(provide 'deh-dired)
