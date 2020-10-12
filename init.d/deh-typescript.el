(require 'company)
(require 'smartparens)

(evil-set-initial-state 'typescript-mode 'normal)

(defun deh/typescript-mode-hook ()
  "my typescript mode hook"
  (interactive)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (smartparens-mode t)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  ;; (add-to-list 'company-backends 'company-tide)
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)



(add-hook 'typescript-mode-hook 'deh/typescript-mode-hook)

(add-hook 'typescript-mode-hook #'lsp)

(provide 'deh-typescript)
