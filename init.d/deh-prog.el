(defun deh-prog-mode-hook ()
  "my prog mode hook"
  (setq display-line-numbers 'relative)
  ;; (setq display-line-numbers 'nil)
  (visual-line-mode nil)
  (modify-syntax-entry ?_ "w")
  )

(add-hook 'prog-mode-hook 'deh-prog-mode-hook)

(provide 'deh-prog)
