(require 'evil)

(evil-set-initial-state 'yaml-mode 'normal)

(defun deh-yaml-mode-hook ()
  (setq display-line-numbers 'relative)
  (modify-syntax-entry ?_ "w")
  (flycheck-mode t))

(add-hook 'yaml-mode-hook 'deh-yaml-mode-hook)

(provide 'deh-yaml)
