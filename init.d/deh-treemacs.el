(require 'treemacs)
;; (require 'treemacs-projectile)
;; (require 'treemacs-evil)
;; (require 'deh-movement)
(require 'evil)

;; (setq treemacs-no-png-images t)

;; (defun deh-treemacs-mode-hook ()
;;   "my treemacs mode hook"
;;   (setq treemacs--width-is-locked t))

;; (add-hook 'treemacs-mode-hook 'deh-treemacs-mode-hook)

(setq treemacs-follow-mode nil)

;; fix from here https://github.com/Alexander-Miller/treemacs/issues/349#issuecomment-482102120
(defun config/fix-evil-window-move (orig-fun &rest args)
  "Close Treemacs while moving windows around."
  (let* ((treemacs-window (treemacs-get-local-window))
         (is-active (and treemacs-window (window-live-p treemacs-window))))
    (when is-active (treemacs))
    (apply orig-fun args)
    (when is-active
      (save-selected-window
        (treemacs)))))

(dolist (func '(evil-window-move-far-left evil-window-move-far-right evil-window-move-very-top evil-window-move-very-bottom))
  (advice-add func :around #'config/fix-evil-window-move))


;; (define-key treemacs-mode-map (kbd "M-l") 'deh-windmove-create-or-select-window-right)
;; (define-key treemacs-mode-map (kbd "M-h") 'deh-windmove-create-or-select-window-left)
;; (define-key treemacs-mode-map (kbd "M-k") 'deh-windmove-create-or-select-window-up)
;; (define-key treemacs-mode-map (kbd "M-j") 'deh-windmove-create-or-select-window-down)
;; (define-key treemacs-mode-map (kbd "M-H") 'evil-window-move-far-left)
;; (define-key treemacs-mode-map (kbd "M-J") 'evil-window-move-very-bottom)
;; (define-key treemacs-mode-map (kbd "M-K") 'evil-window-move-very-top)
;; (define-key treemacs-mode-map (kbd "M-L") 'evil-window-move-far-right)

(provide 'deh-treemacs)
