(defun deh-css-mode-hook ()
  "my css mode hook"

  (setq css-indent-offset 2)
  (smartparens-mode t))

(add-hook 'css-mode-hook 'deh-css-mode-hook)

(evil-set-initial-state 'css-mode 'normal)

(provide 'deh-css)
