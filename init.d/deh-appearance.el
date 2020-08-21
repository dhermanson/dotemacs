;;; package --- Summary
;; Setup the appearance of my emacs session
;;; Commentary:
;;; Code:
;; (require 'diminish)
(require 'markdown-mode)
;; (require 'doom-themes)
;; (require 'all-the-icons)
;; (require 'powerline)

;; (powerline-vim-theme)
;; (powerline-default-theme)

(setq-default tab-width 2)
(setq inhibit-startup-screen t)
(column-number-mode 1) ; display column/row of cursor in mode-line
(show-paren-mode 1)
(global-hl-line-mode 1)
;; (setq-default left-fringe-width 5)
;; (setq-default right-fringe-width 5)

;; fonts
;;(set-frame-font "Source Code Pro-12" nil t)
;; (set-frame-font "Hack" 12 t)
;; (set-face-font 'markdown-pre-face "Monaco-14")
;; (set-face-font 'markdown-inline-code-face "Monaco-14")
;; (set-face-font 'markdown-language-keyword-face "Monaco-14")
;; (set-face-font 'markdown-code-face "Monaco-14")

;; (set-frame-font "-ADBO-Source Code Pro for Powerline-*-*-*-*-24-*-*-*-m-0-iso10646-1")
;; (add-to-list 'default-frame-alist '(font . "Source Code Pro for Powerline-22"))

;; (add-to-list 'default-frame-alist '(font . "-ADBO-Source Code Pro for Powerline-normal-normal-normal-*-24-*-*-*-m-0-iso10646-1"))
(add-to-list 'default-frame-alist '(font . "-unknown-Monaco-normal-normal-normal-*-22-*-*-*-m-0-iso10646-1"))
(add-to-list 'default-frame-alist '(height . 35))
(add-to-list 'default-frame-alist '(width . 125))
;; (set-frame-font  "-ADFP-Universalis ADF Std-normal-normal-normal-*-41-*-*-*-*-0-iso10646-1")
;; (set-frame-font "-DAMA-Ubuntu-normal-normal-normal-*-41-*-*-*-*-0-iso10646-1")
;; (set-frame-font "-unknown-Monaco-normal-normal-normal-*-24-*-*-*-m-0-iso10646-1")

;; (set-face-font 'default "-ADBO-Source Code Pro for Powerline-normal-normal-normal-*-22-*-*-*-m-0-iso10646-1")
;; (set-face-font 'italic "-ADBO-Source Code Pro for Powerline-normal-italic-normal-*-22-*-*-*-m-0-iso10646-1")
;; (set-face-font 'bold "-ADBO-Source Code Pro for Powerline-bold-normal-normal-*-22-*-*-*-m-0-iso10646-1")

;; colors
(defun deh-load-zenburn ()
  "Load zenburn."
  (require 'zenburn-theme)
  (load-theme 'zenburn t)
  (set-face-background 'fringe "#3F3F3F")
  (set-face-background 'line-number "#3F3F3F")
  (set-face-foreground 'vertical-border (cdr (assoc "zenburn-bg-1" zenburn-default-colors-alist))))

(defun deh/load-solarized-dark ()
  (load-theme 'solarized-dark t)
  (require 'avy)
  (let (($background (cdr (assoc 'base03 solarized-dark-color-palette-alist))))
    
    ;; (set-face-background 'avy-lead-face (cdr (assoc "base03" solarized-dark-color-palette-alist)))
    ;; (set-face-foreground 'avy-lead-face "#cb4b16")
    (set-face-attribute 'avy-lead-face nil :background $background :foreground "#cb4b16")
    (set-face-attribute 'avy-lead-face-0 nil :background $background :foreground "#859900")
    (set-face-attribute 'avy-lead-face-1 nil :background $background :foreground "#b58900")
    (set-face-attribute 'avy-lead-face-2 nil :background $background :foreground "#268bd2")
    )
  )
;; (deh/load-solarized-dark)
;; (load-theme 'solarized-light t)
;; (load-theme 'solarized-gruvbox-dark t)
;; (load-theme 'solarized-gruvbox-light t)
;; (deh-load-zenburn)
;; (load-theme 'dracula t)
;; (load-theme 'anti-zenburn t)

;; (load-theme 'humanoid-light t)
;; (load-theme 'paper t)
;; (load-theme 'whiteboard t)
;; TODO: customize modus-operandi
;;       https://gitlab.com/protesilaos/modus-themes
(load-theme 'modus-operandi t)
;; (load-theme 'modus-vivendi t)
;; (load-theme 'gruvbox-dark-medium t)
;; (load-theme 'gruvbox-dark-hard t)
;; (load-theme 'gruvbox-light-medium t)
;; (load-theme 'sanityinc-tomorrow-night t)
;; (load-theme 'sanityinc-tomorrow-day t)
;; (load-theme 'doom-one t)
;; (load-theme 'flatui t)
;; (load-theme 'plan9 t)
;; (load-theme 'moe-light t)
;; (load-theme 'twilight-bright t)
;; (load-theme 'material-light t)

;; (load-theme 'doom-one-light t)
;; (load-theme 'doom-acario-light t)
;; (load-theme 'doom-nord-light t)
;; (load-theme 'spacemacs-light t)

;; (load-theme 'nord t)

;; (add-hook 'prog-mode-hook (lambda ()
;;                             (progn
;;                               ;; (set-face-font 'font-lock-comment-face "-ADBO-Source Code Pro for Powerline-normal-italic-normal-*-22-*-*-*-m-0-iso10646-1")
;;                               ;; (set-face-font 'font-lock-comment-delimiter-face "-ADBO-Source Code Pro for Powerline-normal-italic-normal-*-22-*-*-*-m-0-iso10646-1"))))

;;                               (set-face-font 'font-lock-doc-face "-ADBO-Source Code Pro for Powerline-normal-italic-normal-*-*-*-*-*-m-0-iso10646-1")
;;                               (set-face-font 'font-lock-comment-face "-ADBO-Source Code Pro for Powerline-normal-italic-normal-*-*-*-*-*-m-0-iso10646-1")
;;                               (set-face-font 'font-lock-comment-delimiter-face "-ADBO-Source Code Pro for Powerline-normal-italic-normal-*-*-*-*-*-m-0-iso10646-1"))))

;; (defun deh/clear-frame-background-in-terminal (&optional frame)
;;   (with-selected-frame frame
;;     (unless (display-graphic-p frame)
;;       (progn
;;         (set-face-background 'default "unspecified-bg" frame)
;;         (set-face-background 'line-number "unspecified-bg" frame)))))

;; (add-hook 'after-make-frame-functions 'deh/clear-frame-background-in-terminal)

;; (add-hook 'window-setup-hook 'deh/clear-frame-background-in-terminal)
;; (add-hook 'server-switch-hook 'deh/clear-frame-background-in-terminal)

;; (add-hook 'server-visit-hook 'deh/clear-frame-background-in-terminal)


;; (require 'server)
;; (defadvice server-create-window-system-frame
;;   (after deh/clear-frame-background-in-terminal ())
;;   "Set custom frame colours when creating the first frame on a display"
;;   (message "Running after frame-initialize")
;;   (deh/clear-frame-background-in-terminal))
;; (ad-activate 'server-create-window-system-frame)
;; (add-hook 'after-make-frame-functions 'deh/clear-frame-background-in-terminal t)


;; (load-theme 'xresources t)

;; (load-theme 'ujelly t)

;; (color-theme-sanityinc-tomorrow-night)
;; (load-theme 'sanityinc-tomorrow-day t)
;; (load-theme 'sanityinc-tomorrow-eighties t)
;; (load-theme 'omtose-softer t)
;; (load-theme 'omtose-darker t)
;; (load-theme 'darktooth t)
;; (darktooth-modeline)
;; (load-theme 'gruvbox-dark-hard t)
;; (load-theme 'gruvbox-dark-soft t)
;; (load-theme 'gruvbox-dark-medium t)
;; (load-theme 'gruvbox-light-hard t)

;; (load-theme 'base16-default-dark t)
;; (load-theme 'monokai t)
;; (load-theme 'molokai t)
;; (load-theme 'base16-github t)
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

;; (load-theme 'challenger-deep t)

;; (deh-load-doom-theme-setup)
;; (load-theme 'doom-one-light t)
;; (load-theme 'doom-challenger-deep t)

;; (load-theme 'doom-acario-light t)
;; (load-theme 'doom-moonlight t) ;; this is nice
;; (load-theme 'doom-nord-light t) ;; this is ok
;; (load-theme 'doom-molokai t)
;; (load-theme 'doom-vibrant t)
;; (load-theme 'doom-opera t)
;; (load-theme 'doom-opera-light t)
;; (load-theme 'doom-solarized-light t)
;; (load-theme 'doom-tomorrow-night t)
;; (load-theme 'doom-tomorrow-day t)
;; (load-theme 'doom-sourcerer t)
;; (load-theme 'doom-city-lights t)
;; (load-theme 'doom-spacegrey t)
;; (load-theme 'doom-nova t)
;; (load-theme 'doom-dracula t)
;; (load-theme 'doom-Iosvkem t)
;; (load-theme 'doom-nord t)
;; (load-theme 'doom-gruvbox-light t)
;; (load-theme 'doom-peacock t)

;; (load-theme 'gruvbox-dark-medium t)
;; (load-theme 'hc-zenburn t)
;; (load-theme 'anti-zenburn t)
;; (load-theme 'spacemacs-dark t)
;; (load-theme 'spacemacs-light t)
;; (require 'spacemacs-theme)
;; (load-theme 'badger t)
;; (load-theme 'monokai t)
;; (load-theme 'sexy-monochrome t)
;; (load-theme 'monochrome t)
;; (load-theme 'quasi-monochrome t)
;; (load-theme 'tao-yin t)
;; (load-theme 'eziam-light t)
;; (load-theme 'leuven t)
;; (load-theme 'adwaita t)
;; (load-theme 'tango t)


(provide 'deh-appearance)
;;; deh-appearance.el ends here
