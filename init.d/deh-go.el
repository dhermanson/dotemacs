(require 'smartparens)
(require 'lsp)
(require 'evil)
(require 'go-mode)

(evil-set-initial-state 'go-mode 'normal)
(evil-set-initial-state 'go-dot-mod-mode 'normal)

(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing


(defun deh-go-mode-hook ()
  "my go mode hook"
  (evil-surround-mode t)
  (smartparens-mode t)
  (require 'company)
  ;; (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)
  ;; (define-key go-mode-map (kbd "C-;") 'go-ac/complete-at-point)
  )

(add-hook 'go-mode-hook 'deh-go-mode-hook)
;; (add-hook 'go-mode-hook 'lsp-deferred)
(add-hook 'go-mode-hook #'lsp)

(add-hook 'before-save-hook 'gofmt-before-save)



(provide 'deh-go)
