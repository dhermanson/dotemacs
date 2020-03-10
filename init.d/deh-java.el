(require 'flycheck)
(require 'smartparens)
;; (require 'lsp-java)

;; (setq lsp-java-server-install-dir "~/repos/eclipse")

(defun deh-java-mode-hook ()
  "my java mode hook"
  (setq indent-tabs-mode nil
	      tab-width 4
	      c-basic-offset 4)
  
  (flycheck-mode t)
  (smartparens-mode t)
  (company-mode t)
  ;; (lsp)
  )

(add-hook 'java-mode-hook 'deh-java-mode-hook)

(provide 'deh-java)
