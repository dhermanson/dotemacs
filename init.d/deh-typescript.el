(require 'company)
(require 'tide)
(require 'smartparens)

(evil-set-initial-state 'typescript-mode 'normal)

(defun deh-setup-tide-mode ()
  "setup tide mode"
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (smartparens-mode t)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (add-to-list 'company-backends 'company-tide)
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

(add-hook 'before-save-hook 'tide-format-before-save)

;; (defun deh-typescript-hook ()
;;   "my typescript hook"
;;   (tide-setup)
;;   (company-mode t)
;;   (flycheck-mode t)
;;   (eldoc-mode t)
;;   (tide-hl-identifier-mode +1)
;;   (smartparens-mode t)
;;   (set (make-local-variable 'company-backends) '(company-tide)))

;; (add-hook 'typescript-mode-hook 'deh-typescript-hook)
(add-hook 'typescript-mode-hook 'deh-setup-tide-mode)

(provide 'deh-typescript)
