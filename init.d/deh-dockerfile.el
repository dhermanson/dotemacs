(require 'dockerfile-mode)
(defun deh/dockerfile-mode-hook ()
  "My dockerfile mode hook."
  (setq tab-width 4))

(add-hook 'dockerfile-mode-hook 'deh/dockerfile-mode-hook)

(provide 'deh-dockerfile)
