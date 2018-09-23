(require 'all-the-icons-dired)

(setq dired-dwim-target t) ;; press C to copy to other dir

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(provide 'deh-dired)
