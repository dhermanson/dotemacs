(defun deh-markdown-mode-hook ()
  "my markdown mode hook"
  (flycheck-mode t)
  (setq visual-line-mode t)
  (setq truncate-lines nil)
  (setq display-line-numbers 'relative))

(add-hook 'markdown-mode-hook 'deh-markdown-mode-hook)

(add-to-list 'auto-mode-alist '("README" . markdown-mode))

(provide 'deh-markdown)
