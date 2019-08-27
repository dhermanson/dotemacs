(require 'neotree)
(require 'evil)
(require 'deh-movement)

(setq neo-window-fixed-size nil)
;; (setq neo-window-width 25)
(setq neo-window-width 40)
;; (setq neo-theme 'arrow)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq neo-autorefresh nil)
(setq  neo-show-hidden-files t)

(define-key neotree-mode-map (kbd "M-l") 'deh-windmove-create-or-select-window-right)
(define-key neotree-mode-map (kbd "M-h") 'deh-windmove-create-or-select-window-left)
(define-key neotree-mode-map (kbd "M-k") 'deh-windmove-create-or-select-window-up)
(define-key neotree-mode-map (kbd "M-j") 'deh-windmove-create-or-select-window-down)

;; (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
;; (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
;; (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
;; (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
;; (evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
;; (evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
;; (evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
;; (evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
;; (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)


(evil-set-initial-state 'neotree-mode 'emacs)

(provide 'deh-neotree)
