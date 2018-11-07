(require 'flycheck)
(require 'smartparens)

(defun deh-java-mode-hook ()
  "my java mode hook"
  (setq indent-tabs-mode nil
	tab-width 2
	c-basic-offset 2)
  
  (flycheck-mode t)
  (smartparens-mode t)
  (company-mode t)
  )

(add-hook 'java-mode-hook 'deh-java-mode-hook)

(provide 'deh-java)
