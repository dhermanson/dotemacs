(defun deh-css-mode-hook ()
  "my css mode hook"

  (setq css-indent-offset 2)
  (smartparens-mode t)
  (set (make-local-variable 'company-backends) '((
                                                  company-css
                                                  company-files
                                                  company-dabbrev-code
                                                  company-yasnippet))))

(add-hook 'css-mode-hook 'deh-css-mode-hook)

(evil-set-initial-state 'css-mode 'normal)

(provide 'deh-css)
