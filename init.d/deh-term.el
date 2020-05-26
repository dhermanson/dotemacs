(require 'evil)
(require 'term)

;; (evil-set-initial-state 'term-line-mode 'normal)
;; (evil-set-initial-state 'term-char-mode 'emacs)
(evil-set-initial-state 'term-mode 'emacs)
; (evil-set-initial-state 'term-raw-mode 'emacs)

;; https://mullikine.github.io/posts/taming-term/
;; https://joelmccracken.github.io/entries/switching-between-term-mode-and-line-mode-in-emacs-term/
(defun deh/hooks/term-mode-hook ()
  (interactive)
  (define-key term-raw-map (kbd "C-c C-k") 'term-line-mode)
  (define-key term-raw-map (kbd "C-h") 'term-send-raw)
  (define-key term-raw-map (kbd "C-n") 'term-send-raw)
  (define-key term-raw-map (kbd "C-p") 'term-send-raw))

;; (defun deh/hooks/term-line-mode-hook ()
;;   (interactive)
;;   (evil-normal-state))

;; (defun deh/hooks/term-char-mode-hook ()
;;   (interactive)
;;   (evil-emacs-state))

;; (add-hook 'term-line-mode-hook 'deh/hooks/term-line-mode-hook)
;; (add-hook 'term-char-mode-hook 'deh/hooks/term-char-mode-hook)
(add-hook 'term-mode-hook 'deh/hooks/term-mode-hook)


(provide 'deh-term)
