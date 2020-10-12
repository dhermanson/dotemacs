(require 'flycheck)
(require 'smartparens)
(require 'lsp-java)
(require 'dap-java)

;; (setq lsp-java-server-install-dir "~/repos/eclipse")

(defun deh-java-mode-hook ()
  "my java mode hook"
  (setq indent-tabs-mode nil
	      tab-width 4
	      c-basic-offset 4)
  
  (flycheck-mode t)
  (smartparens-mode t)
  (company-mode t)
  (set (make-local-variable 'company-backends) '(( company-capf )))
  )

(add-hook 'java-mode-hook 'deh-java-mode-hook)
(add-hook 'java-mode-hook #'lsp)

(provide 'deh-java)
