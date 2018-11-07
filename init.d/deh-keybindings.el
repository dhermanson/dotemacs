(require 'deh-ripgrep)
(require 'helm)
(require 'projectile)


;; Backspace ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key [(control ?h)] 'delete-backward-char)
(global-set-key (kbd "C-M-?") 'help-command)

(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-map (kbd "C-M-?") 'helm-command)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-key global-map (kbd "s-g") (kbd "C-g"))
(define-key global-map (kbd "H-g") (kbd "C-g"))

(define-key global-map (kbd "H-r") 'recompile)
(define-key global-map (kbd "H-a") 'deh-ripgrep)
(define-key global-map (kbd "H-b") 'helm-projectile-switch-to-buffer)
(define-key global-map (kbd "H-t") 'helm-etags-select)
(define-key global-map (kbd "H-f") 'helm-projectile-find-file)
(define-key global-map (kbd "H-p") 'projectile-command-map)
(define-key global-map (kbd "C-c p") 'projectile-command-map)
(define-key global-map (kbd "H-SPC") 'ace-jump-char-mode)
(define-key global-map (kbd "H-w") 'ace-jump-word-mode)

;; (define-key global-map (kbd "s-p") 'projectile-command-map)

(define-key global-map (kbd "H-c") 'delete-window)
(define-key global-map (kbd "H-C") 'delete-frame)
(define-key global-map (kbd "H-o") 'delete-other-windows)
(define-key global-map (kbd "H-n") 'make-frame-command)
(define-key global-map (kbd "H-q") '(lambda ()
                                      (interactive)
                                      (kill-buffer (current-buffer))))

(define-key global-map (kbd "M-i") 'helm-imenu)
(define-key global-map (kbd "M-I") 'helm-imenu-in-all-buffers)


;; (define-key global-map (kbd "s-c") 'delete-window)
;; (define-key global-map (kbd "s-o") 'delete-other-windows)
;; (define-key global-map (kbd "s-n") 'make-frame-command)
;; (define-key global-map (kbd "s-q") '(lambda ()
;;                                       (interactive)
;;                                       (kill-buffer (current-buffer))))

;; (define-key global-map (kbd "s-i") 'helm-imenu)
;; (define-key global-map (kbd "s-I") 'helm-imenu-in-all-buffers)

(provide 'deh-keybindings)
