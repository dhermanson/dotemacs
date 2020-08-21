(require 'deh-ripgrep)
(require 'projectile)
(require 'expand-region)

;; TODO: use H-o as a prefix? or H-e
(defun deh/projectile-open-terminal ()
  (interactive)
  (if (projectile-project-p)
      (start-process-shell-command "terminal" nil (concat "gnome-terminal 2> /dev/null --working-directory " (projectile-project-root) " -e tmux new zsh" ))))

(defun deh/open-terminal ()
  (interactive)
  (start-process-shell-command "terminal" nil (concat "gnome-terminal 2> /dev/null --working-directory " default-directory " -e tmux new zsh" )))

(defun deh/projectile-open-file-manager ()
  (interactive)
  (if (projectile-project-p)
      (start-process-shell-command "deh-file-manager" nil (concat "EDITOR=\"emacsclient -s " server-name "\" deh-file-manager 2> /dev/null " (projectile-project-root)))))


(define-key global-map (kbd "H-d") 'deh/projectile-open-file-manager)



(defun deh/open-file-manager ()
  (interactive)
  (start-process-shell-command "deh-file-manager" nil (concat "deh-file-manager 2> /dev/null " default-directory)))

(define-key global-map (kbd "H-C-d") 'deh/open-file-manager)


;; Backspace ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key [(control ?h)] 'delete-backward-char)
;; (global-set-key (kbd "C-M-?") 'help-command)
(global-set-key (kbd "H-/") 'help-command)
;; (global-set-key (kbd "C-H-h") 'help-command)
;; (global-set-key (kbd "H-C-h") 'help-command)
;; (global-set-key (kbd "C-;") 'help-command)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (define-key global-map (kbd "s-g") (kbd "C-g"))
;; (define-key global-map (kbd "H-g") (kbd "C-g"))
(define-key global-map (kbd "H-g") 'keyboard-quit)

(define-key global-map (kbd "H-r") 'recompile)
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
(define-key global-map (kbd "<f8>") 'deh/projectile-open-terminal)
(define-key global-map (kbd "<f9>") 'deh/open-terminal)

(define-key global-map (kbd "C-c f") 'deh-projectile-fzf-find-file)
;; (define-key global-map (kbd "C-c f") 'deh/tmux/fzf-projectile-find-file)

(define-key global-map (kbd "C-x b") 'ivy-switch-buffer)
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

(define-key global-map (kbd "s-f") 'projectile-find-file)
(define-key global-map (kbd "s-b") 'projectile-switch-to-buffer)
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
(define-key global-map (kbd "s-p") 'projectile-command-map)

(define-key global-map (kbd "s-o") 'delete-other-windows)

(define-key global-map (kbd "s-c") 'delete-window)
(define-key global-map (kbd "H-C") 'delete-frame)
(define-key global-map (kbd "H-o") 'delete-other-windows)
(define-key global-map (kbd "H-n") 'make-frame-command)
(define-key global-map (kbd "H-q") '(lambda ()
                                      (interactive)
                                      (kill-buffer (current-buffer))))


(provide 'deh-keybindings)
