(require 'deh-ripgrep)
(require 'projectile)
(require 'expand-region)

;; TODO: use H-o as a prefix? or H-e
(defun deh/projectile-open-terminal ()
  (interactive)
  (if (projectile-project-p)
      (start-process-shell-command "terminal" nil (concat "xfce4-terminal --working-directory=" (projectile-project-root)  ))))

(defun deh/open-terminal ()
  (interactive)
  (start-process-shell-command "terminal" nil (concat "xfce4-terminal --working-directory=" default-directory )))

(defun deh/projectile-open-file-manager ()
  (interactive)
  (if (projectile-project-p)
      (start-process-shell-command "deh-file-manager" nil (concat "dolphin " (projectile-project-root)))))


(define-key global-map (kbd "H-d") 'deh/projectile-open-file-manager)



(defun deh/open-file-manager ()
  (interactive)
  (start-process-shell-command "deh-file-manager" nil (concat "dolphin " default-directory)))


;; (define-key key-translation-map (kbd "s-i") (kbd "C-c"))
;; (define-key key-translation-map (kbd "s-d") (kbd "C-c"))
;; (define-key key-translation-map (kbd "s-;") (kbd "C-c"))
;; (define-key key-translation-map (kbd "s-g") (kbd "C-g"))

(define-key global-map (kbd "H-C-d") 'deh/open-file-manager)


;; Backspace ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key [(control ?h)] 'delete-backward-char)
;; (global-set-key (kbd "C-M-?") 'help-command)
(global-set-key (kbd "H-/") 'help-command)
(global-set-key (kbd "s-?") 'help-command)
;; (global-set-key (kbd "C-H-h") 'help-command)
;; (global-set-key (kbd "H-C-h") 'help-command)
;; (global-set-key (kbd "C-;") 'help-command)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (define-key global-map (kbd "s-g") (kbd "C-g"))
;; (define-key global-map (kbd "H-g") (kbd "C-g"))
(define-key global-map (kbd "H-g") 'keyboard-quit)

(define-key global-map (kbd "s-r") 'recompile)
;; (define-key global-map (kbd "H-a") 'deh/projectile/grep)
;; (define-key global-map (kbd "H-a") 'deh/projectile/grep)
;; (define-key global-map (kbd "H-s") 'deh/projectile/ripgrep)
(define-key global-map (kbd "H-f") 'deh-projectile-fzf-find-file)
(define-key global-map (kbd "H-p") 'projectile-command-map)
(define-key global-map (kbd "C-c p") 'projectile-command-map)
(define-key global-map (kbd "H-SPC") 'company-complete)
(define-key global-map (kbd "H-w") 'avy-goto-word-1)
(define-key global-map (kbd "H-;") 'avy-goto-char)
(define-key global-map (kbd "H-<tab>") 'other-frame)

;; (define-key global-map (kbd "s-p") 'projectile-command-map)

(define-key global-map (kbd "H-c") 'delete-window)
(define-key global-map (kbd "H-C") 'delete-frame)
(define-key global-map (kbd "H-o") 'delete-other-windows)
(define-key global-map (kbd "H-n") 'make-frame-command)
(define-key global-map (kbd "H-q") '(lambda ()
                                      (interactive)
                                      (kill-buffer (current-buffer))))

(define-key global-map (kbd "<f2>") 'deh/open-magit-in-new-gui-frame)
(define-key global-map (kbd "<f3>") 'deh/open-current-file-in-new-gui-frame)
(define-key global-map (kbd "<f4>") 'deh/open-file-in-new-gui-frame)
(define-key global-map (kbd "<f7>") 'recompile)
(define-key global-map (kbd "C-c o e") 'deh/projectile-open-file-manager)
(define-key global-map (kbd "C-c o E") 'deh/open-file-manager)
(define-key global-map (kbd "C-c o t") 'deh/projectile-open-terminal)
(define-key global-map (kbd "C-c o T") 'deh/open-terminal)
(define-key global-map (kbd "C-c o s l") 'org-store-link)
(define-key global-map (kbd "C-c s") 'swiper)
(define-key global-map (kbd "C-c S") 'swiper-all)

(define-key global-map (kbd "C-c f") 'deh-projectile-fzf-find-file)
;; (define-key global-map (kbd "C-c f") 'deh/tmux/fzf-projectile-find-file)

(define-key global-map (kbd "C-x b") 'ivy-switch-buffer)
(define-key global-map (kbd "C-x C-b") 'ibuffer)
(define-key global-map (kbd "s-B") 'ibuffer)
(define-key global-map (kbd "M-x") 'counsel-M-x)
(define-key global-map (kbd "C-x C-f") 'counsel-find-file)

;; (define-key global-map (kbd "s-c") 'delete-window)
;; (define-key global-map (kbd "s-o") 'delete-other-windows)
;; (define-key global-map (kbd "s-n") 'make-frame-command)
;; (define-key global-map (kbd "s-q") '(lambda ()
;;                                       (interactive)
;;                                       (kill-buffer (current-buffer))))


(define-key global-map (kbd "C-=") 'er/expand-region)

(define-key global-map (kbd "C-'") 'avy-goto-word-1)


(define-key global-map (kbd "s-SPC") 'company-complete)

(defun deh/kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(define-key global-map (kbd "s-C-f") 'toggle-frame-fullscreen)
(define-key global-map (kbd "s-f") 'projectile-find-file)
(define-key global-map (kbd "s-b") 'projectile-switch-to-buffer)
(define-key global-map (kbd "s-t") 'projectile-run-vterm)
(define-key global-map (kbd "s-q") 'deh/kill-current-buffer)
(define-key global-map (kbd "s-x") 'counsel-M-x)
(define-key global-map (kbd "s-w") 'save-buffer)
(define-key global-map (kbd "s-e") 'er/expand-region)
(define-key global-map (kbd "s-h") 'deh-windmove-create-or-select-window-left)
(define-key global-map (kbd "s-H") 'evil-window-move-far-left)
(define-key global-map (kbd "s-j") 'deh-windmove-create-or-select-window-down)
(define-key global-map (kbd "s-J") 'evil-window-move-very-bottom)
(define-key global-map (kbd "s-k") 'deh-windmove-create-or-select-window-up)
(define-key global-map (kbd "s-K") 'evil-window-move-very-top)
(define-key global-map (kbd "s-l") 'deh-windmove-create-or-select-window-right)
(define-key global-map (kbd "s-L") 'evil-window-move-far-right)
(define-key global-map (kbd "s-n") 'make-frame-command)
(define-key global-map (kbd "s-<escape>") 'other-frame)
(define-key global-map (kbd "s-<backspace>") 'other-frame)
(define-key global-map (kbd "s-C") 'delete-frame)
(define-key global-map (kbd "s-p") 'projectile-command-map)

(define-key global-map (kbd "s-o") 'delete-other-windows)
(define-key global-map (kbd "s-O") 'delete-other-frames)

(define-key global-map (kbd "s-c") 'delete-window)
(define-key global-map (kbd "H-C") 'delete-frame)
(define-key global-map (kbd "H-o") 'delete-other-windows)
(define-key global-map (kbd "H-n") 'make-frame-command)
(define-key global-map (kbd "H-q") '(lambda ()
                                      (interactive)
                                      (kill-buffer (current-buffer))))


(define-key global-map (kbd "M-h") 'deh-windmove-create-or-select-window-left)
(define-key global-map (kbd "M-H") 'evil-window-move-far-left)
(define-key global-map (kbd "M-j") 'deh-windmove-create-or-select-window-down)
(define-key global-map (kbd "M-J") 'evil-window-move-very-bottom)
(define-key global-map (kbd "M-k") 'deh-windmove-create-or-select-window-up)
(define-key global-map (kbd "M-K") 'evil-window-move-very-top)
(define-key global-map (kbd "M-l") 'deh-windmove-create-or-select-window-right)
(define-key global-map (kbd "M-L") 'evil-window-move-far-right)
(define-key global-map (kbd "M-o") 'delete-other-windows)
(define-key global-map (kbd "M-c") 'delete-window)


(provide 'deh-keybindings)
