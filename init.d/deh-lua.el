(require 'evil)
(require 'smartparens)
;; (require 'company-lua)
(require 'company-etags)
(require 'company-dabbrev-code)
(require 'company-yasnippet)

(evil-set-initial-state 'lua-mode 'normal)

(defun deh-lua-mode-hook ()
  "my lua mode hook"
  (company-mode t)
  (flycheck-mode t)
  (eldoc-mode t)
  (smartparens-mode t)
  (setq-local company-backends '((;; company-lua
                                  company-etags
                                  company-dabbrev-code
                                  company-yasnippet))))

(add-hook 'lua-mode-hook 'deh-lua-mode-hook)

(provide 'deh-lua)
