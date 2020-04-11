;; (require 'doom-modeline)

;; (require 'diminish)
;; (require 'spaceline-config)
;; (require 'spaceline-all-the-icons)
;; (spaceline-spacemacs-theme)
;; (spaceline-helm-mode)
;; (spaceline-info-mode)

;; (doom-modeline-mode 1)

;; (setq doom-modeline-icon nil)
;; (setq doom-modeline-major-mode-icon nil)
;; (setq doom-modeline-major-mode-color-icon nil)

;; (setq doom-modeline-buffer-state-icon t)

;; (setq-default mode-line-format
;;           '((:eval
;;              (if (buffer-file-name)
;;                  (abbreviate-file-name (buffer-file-name))
;;                "%b"))))

;; (eval-after-load 'yasnippet '(diminish 'yas-minor-mode))
;; (eval-after-load 'paredit '(diminish 'paredit-mode))
;; (eval-after-load 'eldoc '(diminish 'eldoc-mode))
;; (eval-after-load 'which-key '(diminish 'which-key-mode))
;; (eval-after-load 'helm-mode '(diminish 'helm-mode))
;; (eval-after-load 'company '(diminish 'company-mode))
;; (eval-after-load 'undo-tree '(diminish 'undo-tree-mode))
;; (eval-after-load 'projectile '(diminish 'projectile-mode))
;; (eval-after-load 'evil-commentary '(diminish 'evil-commentary-mode))
;; (eval-after-load 'emmet-mode '(diminish 'emmet-mode))
;; (eval-after-load 'editorconfig '(diminish 'editorconfig-mode))
;; (eval-after-load 'flycheck '(diminish 'flycheck-mode))
;; (eval-after-load 'autorevert '(diminish 'auto-revert-mode))
;; (eval-after-load 'smartparens '(diminish 'smartparens-mode))
;; (eval-after-load 'omnisharp '(diminish 'omnisharp-mode))
;; (eval-after-load 'robe '(diminish 'robe-mode))
;; (eval-after-load 'abbrev '(diminish 'abbrev-mode))
;; (diminish 'visual-line-mode)


(provide 'deh-modeline)
