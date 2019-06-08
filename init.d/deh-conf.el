(defun deh-conf-mode-hook ()
  "my conf mode hook"
  (setq display-line-numbers 'relative))

(add-hook 'conf-mode-hook 'deh-conf-mode-hook)

(provide 'deh-conf)
