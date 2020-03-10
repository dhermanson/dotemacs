(defun deh/feature-mode-hook ()
  "my feature-mode hook"
  (setq display-line-numbers 'relative))

(add-hook 'feature-mode-hook 'deh/feature-mode-hook)

(provide 'deh-feature)
