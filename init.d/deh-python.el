(require 'lsp)

(add-hook 'python-mode-hook
          '(lambda ()
             (set (make-local-variable 'company-backends) '(( company-capf )))
             (flycheck-mode 1)))

(add-hook 'python-mode-hook #'lsp)


(provide 'deh-python)
