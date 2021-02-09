(require 'lsp)

(add-hook 'python-mode-hook
          '(lambda ()
             (set (make-local-variable 'company-backends) '(( company-capf )))
             (flycheck-mode 1)

             (setq deh-repl-enabled t)
             (setq deh-repl-process-name "deh-python")
             (setq deh-repl-buffer-name "*deh-python*")
             (setq deh-repl-program "python3")))

;; (add-hook 'python-mode-hook #'lsp)


(provide 'deh-python)
