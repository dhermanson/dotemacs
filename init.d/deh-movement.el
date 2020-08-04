(require 'evil)
(require 'eshell)

(setq lexical-binding t)

(defun deh-windmove-create-or-select-window-right ()
  "create or select window to the right"
  (interactive)
  (let* ((other-window (windmove-find-other-window 'right)))
    (unless other-window
      (evil-window-vsplit))
    (windmove-right)))

(defun deh-windmove-create-or-select-window-left ()
  "create or select window to the left"
  (interactive)
  (let* ((other-window (windmove-find-other-window 'left)))
    (if other-window
	(windmove-left)
      (evil-window-vsplit))))

(defun deh-windmove-create-or-select-window-down ()
  "create or select window to the down"
  (interactive)
  (let* ((other-window (windmove-find-other-window 'down)))
    (if (and (window-minibuffer-p other-window)
	     (not (minibuffer-window-active-p other-window)))
	(evil-window-split))
    (windmove-down)))

(defun deh-windmove-create-or-select-window-up ()
  "create or select window to the up"
  (interactive)
  (let* ((other-window (windmove-find-other-window 'up)))
    (if other-window
	(windmove-up)
      (evil-window-split))))

(define-key global-map (kbd "H-l") 'deh-windmove-create-or-select-window-right)
(define-key global-map (kbd "H-h") 'deh-windmove-create-or-select-window-left)
(define-key global-map (kbd "H-k") 'deh-windmove-create-or-select-window-up)
(define-key global-map (kbd "H-j") 'deh-windmove-create-or-select-window-down)
(define-key global-map (kbd "H-H") 'evil-window-move-far-left)
(define-key global-map (kbd "H-J") 'evil-window-move-very-bottom)
(define-key global-map (kbd "H-K") 'evil-window-move-very-top)
(define-key global-map (kbd "H-L") 'evil-window-move-far-right)


(define-key evil-normal-state-map (kbd "M-l") 'deh-windmove-create-or-select-window-right)
(define-key evil-normal-state-map (kbd "M-h") 'deh-windmove-create-or-select-window-left)
(define-key evil-normal-state-map (kbd "M-k") 'deh-windmove-create-or-select-window-up)
(define-key evil-normal-state-map (kbd "M-j") 'deh-windmove-create-or-select-window-down)
;; (define-key evil-insert-state-map (kbd "M-l") 'deh-windmove-create-or-select-window-right)
;; (define-key evil-insert-state-map (kbd "M-h") 'deh-windmove-create-or-select-window-left)
;; (define-key evil-insert-state-map (kbd "M-k") 'deh-windmove-create-or-select-window-up)
;; (define-key evil-insert-state-map (kbd "M-j") 'deh-windmove-create-or-select-window-down)

(define-key evil-normal-state-map (kbd "M-H") 'evil-window-move-far-left)
(define-key evil-normal-state-map (kbd "M-J") 'evil-window-move-very-bottom)
(define-key evil-normal-state-map (kbd "M-K") 'evil-window-move-very-top)
(define-key evil-normal-state-map (kbd "M-L") 'evil-window-move-far-right)

;; TODO: fix this...lol. we don't want to duplicate the code to add key definitions for these modes
;;       figure out a better way to handle this. AKA: get better at elisp
(define-key comint-mode-map (kbd "M-l") 'deh-windmove-create-or-select-window-right)
(define-key comint-mode-map (kbd "M-h") 'deh-windmove-create-or-select-window-left)
(define-key comint-mode-map (kbd "M-k") 'deh-windmove-create-or-select-window-up)
(define-key comint-mode-map (kbd "M-j") 'deh-windmove-create-or-select-window-down)
(define-key comint-mode-map (kbd "M-H") 'evil-window-move-far-left)
(define-key comint-mode-map (kbd "M-J") 'evil-window-move-very-bottom)
(define-key comint-mode-map (kbd "M-K") 'evil-window-move-very-top)
(define-key comint-mode-map (kbd "M-L") 'evil-window-move-far-right)
(define-key comint-mode-map (kbd "M-c") 'delete-window)
(define-key comint-mode-map (kbd "M-o") 'delete-other-windows)


(define-key comint-mode-map (kbd "M-q") '(lambda ()
                                          (interactive)
                                          (kill-buffer (current-buffer))))

(define-key compilation-mode-map (kbd "M-l") 'deh-windmove-create-or-select-window-right)
(define-key compilation-mode-map (kbd "M-h") 'deh-windmove-create-or-select-window-left)
(define-key compilation-mode-map (kbd "M-k") 'deh-windmove-create-or-select-window-up)
(define-key compilation-mode-map (kbd "M-j") 'deh-windmove-create-or-select-window-down)
(define-key compilation-mode-map (kbd "M-H") 'evil-window-move-far-left)
(define-key compilation-mode-map (kbd "M-J") 'evil-window-move-very-bottom)
(define-key compilation-mode-map (kbd "M-K") 'evil-window-move-very-top)
(define-key compilation-mode-map (kbd "M-L") 'evil-window-move-far-right)
(define-key compilation-mode-map (kbd "M-c") 'delete-window)
(define-key compilation-mode-map (kbd "M-o") 'delete-other-windows)
(define-key compilation-mode-map (kbd "M-q") '(lambda ()
                                          (interactive)
                                          (kill-buffer (current-buffer))))

(define-key grep-mode-map (kbd "M-l") 'deh-windmove-create-or-select-window-right)
(define-key grep-mode-map (kbd "M-h") 'deh-windmove-create-or-select-window-left)
(define-key grep-mode-map (kbd "M-k") 'deh-windmove-create-or-select-window-up)
(define-key grep-mode-map (kbd "M-j") 'deh-windmove-create-or-select-window-down)
(define-key grep-mode-map (kbd "M-H") 'evil-window-move-far-left)
(define-key grep-mode-map (kbd "M-J") 'evil-window-move-very-bottom)
(define-key grep-mode-map (kbd "M-K") 'evil-window-move-very-top)
(define-key grep-mode-map (kbd "M-L") 'evil-window-move-far-right)
(define-key grep-mode-map (kbd "M-c") 'delete-window)
(define-key grep-mode-map (kbd "M-o") 'delete-other-windows)
(define-key grep-mode-map (kbd "M-q") '(lambda ()
                                          (interactive)
                                          (kill-buffer (current-buffer))))

(define-key dired-mode-map (kbd "M-l") 'deh-windmove-create-or-select-window-right)
(define-key dired-mode-map (kbd "M-h") 'deh-windmove-create-or-select-window-left)
(define-key dired-mode-map (kbd "M-k") 'deh-windmove-create-or-select-window-up)
(define-key dired-mode-map (kbd "M-j") 'deh-windmove-create-or-select-window-down)
(define-key dired-mode-map (kbd "M-H") 'evil-window-move-far-left)
(define-key dired-mode-map (kbd "M-J") 'evil-window-move-very-bottom)
(define-key dired-mode-map (kbd "M-K") 'evil-window-move-very-top)
(define-key dired-mode-map (kbd "M-L") 'evil-window-move-far-right)
(define-key dired-mode-map (kbd "M-c") 'delete-window)
(define-key dired-mode-map (kbd "M-o") 'delete-other-windows)
(define-key dired-mode-map (kbd "M-q") '(lambda ()
                                          (interactive)
                                          (kill-buffer (current-buffer))))

(add-hook 'eshell-mode-hook
          (lambda ()
            (define-key eshell-mode-map (kbd "M-l") 'deh-windmove-create-or-select-window-right)
            (define-key eshell-mode-map (kbd "M-h") 'deh-windmove-create-or-select-window-left)
            (define-key eshell-mode-map (kbd "M-k") 'deh-windmove-create-or-select-window-up)
            (define-key eshell-mode-map (kbd "M-j") 'deh-windmove-create-or-select-window-down)
            (define-key eshell-mode-map (kbd "M-H") 'evil-window-move-far-left)
            (define-key eshell-mode-map (kbd "M-J") 'evil-window-move-very-bottom)
            (define-key eshell-mode-map (kbd "M-K") 'evil-window-move-very-top)
            (define-key eshell-mode-map (kbd "M-L") 'evil-window-move-far-right)
            (define-key eshell-mode-map (kbd "M-c") 'delete-window)
            (define-key eshell-mode-map (kbd "M-q") '(lambda ()
                                          (interactive)
                                          (kill-buffer (current-buffer))))))


(provide 'deh-movement)
