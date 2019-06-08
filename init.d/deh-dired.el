(require 'all-the-icons-dired)

(setq dired-dwim-target t) ;; press C to copy to other dir

(defun deh/dired-mode-hook ()
  "My dired mode hook."

  (put 'dired-find-alternate-file 'disabled nil)
  (dired-hide-details-mode 0))

(add-hook 'dired-mode-hook 'deh/dired-mode-hook)

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(provide 'deh-dired)
