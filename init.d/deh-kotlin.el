(require 'flycheck)
(require 'smartparens)

(defun deh-kotlin-mode-hook ()
  "my kotlin mode hook"
  (setq indent-tabs-mode nil
				tab-width 4
				c-basic-offset 4)
  (setq kotlin-tab-width 4)

  (flycheck-mode t)
  (smartparens-mode t)
  (company-mode t))

(add-hook 'kotlin-mode-hook 'deh-kotlin-mode-hook)

(provide 'deh-kotlin)
