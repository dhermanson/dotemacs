;;; package --- Summary
;; Setup the appearance of my emacs session
;;; Commentary:
;;; Code:
(require 'diminish)
(require 'markdown-mode)
(require 'doom-themes)
(require 'all-the-icons)

(setq-default tab-width 2)
(setq inhibit-startup-screen t)
(column-number-mode 1) ; display column/row of cursor in mode-line
(show-paren-mode 1)
(global-hl-line-mode 0)
;; (setq-default left-fringe-width 5)
;; (setq-default right-fringe-width 5)

;; fonts
;;(set-frame-font "Source Code Pro-12" nil t)
;; (set-frame-font "Hack" 12 t)
;; (set-face-font 'markdown-pre-face "Monaco-14")
;; (set-face-font 'markdown-inline-code-face "Monaco-14")
;; (set-face-font 'markdown-language-keyword-face "Monaco-14")
;; (set-face-font 'markdown-code-face "Monaco-14")

;; colors
(defun deh-load-zenburn ()
  "Load zenburn."
  (require 'zenburn-theme)
  (load-theme 'zenburn t)
  (set-face-background 'fringe "#3F3F3F")
  (set-face-foreground 'vertical-border (cdr (assoc "zenburn-bg-1" zenburn-default-colors-alist))))

;; (deh-load-zenburn)
;; (load-theme 'xresources t)


;; (color-theme-sanityinc-tomorrow-night)
;; (load-theme 'sanityinc-tomorrow-night t)
;; (load-theme 'sanityinc-tomorrow-day t)
;; (load-theme 'sanityinc-tomorrow-eighties t)
;; (load-theme 'omtose-softer t)
;; (load-theme 'omtose-darker t)
;; (load-theme 'solarized-light t)
;; (load-theme 'solarized-dark t)
;; (load-theme 'darktooth t)
;; (darktooth-modeline)
;; (load-theme 'gruvbox-dark-hard t)
;; (load-theme 'gruvbox-dark-soft t)
;; (load-theme 'gruvbox-dark-medium t)

;; (load-theme 'base16-default-dark t)
;; (load-theme 'base16-gruvbox-dark-hard t)
;; (load-theme 'base16-gruvbox-dark-medium t)
;; (load-theme 'base16-gruvbox-dark-soft t)
;; (load-theme 'base16-zenburn t)

(defun deh-load-doom-theme-setup ()
  "Load my doom one theme."
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t)

  ;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
  ;; may have their own settings.


  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  (setq doom-neotree-file-icons t)
  ;; or for treemacs users
  ;; (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))
(deh-load-doom-theme-setup)
(load-theme 'doom-one t)

;; (load-theme 'molokai t)
;; (load-theme 'doom-molokai t)
;; (load-theme 'doom-vibrant t)

;; (load-theme 'doom-opera t)
;; (load-theme 'doom-solarized-light t)
;; (load-theme 'doom-tomorrow-night t)
;; (load-theme 'doom-city-lights t)
;; (load-theme 'doom-spacegrey t)
;; (load-theme 'doom-nova t)
;; (load-theme 'doom-dracula t)
;; (load-theme 'hc-zenburn t)
;; (load-theme 'anti-zenburn t)
;; (load-theme 'spacemacs-dark t)
;; (load-theme 'spacemacs-light t)
;; (require 'spacemacs-theme)
;; (load-theme 'badger t)
;; (load-theme 'dracula t)
;; (load-theme 'monokai t)
;; (load-theme 'sexy-monochrome t)
;; (load-theme 'monochrome t)
;; (load-theme 'quasi-monochrome t)
;; (load-theme 'tao-yin t)
;; (load-theme 'eziam-dark t)
;; (load-theme 'leuven t)
;; (load-theme 'adwaita t)
;; (load-theme 'tango t)

(eval-after-load 'yasnippet '(diminish 'yas-minor-mode))
(eval-after-load 'paredit '(diminish 'paredit-mode))
(eval-after-load 'eldoc '(diminish 'eldoc-mode))
(eval-after-load 'which-key '(diminish 'which-key-mode))
(eval-after-load 'helm-mode '(diminish 'helm-mode))
(eval-after-load 'company '(diminish 'company-mode))
(eval-after-load 'undo-tree '(diminish 'undo-tree-mode))
(eval-after-load 'projectile '(diminish 'projectile-mode))
(eval-after-load 'evil-commentary '(diminish 'evil-commentary-mode))
(eval-after-load 'emmet-mode '(diminish 'emmet-mode))
(eval-after-load 'editorconfig '(diminish 'editorconfig-mode))
(eval-after-load 'flycheck '(diminish 'flycheck-mode))
(eval-after-load 'autorevert '(diminish 'auto-revert-mode))
(eval-after-load 'smartparens '(diminish 'smartparens-mode))
(eval-after-load 'omnisharp '(diminish 'omnisharp-mode))
(eval-after-load 'robe '(diminish 'robe-mode))
(eval-after-load 'abbrev '(diminish 'abbrev-mode))
(diminish 'visual-line-mode)

(provide 'deh-appearance)
;;; deh-appearance.el ends here
