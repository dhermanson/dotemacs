(require 'slime)
(require 'evil)

(setq inferior-lisp-program "sbcl")
(evil-set-initial-state 'sime-repl-mode 'emacs)


(slime-setup '(slime-fancy slime-company))
(setq slime-company-completion 'fuzzy)

(evil-define-key 'normal lisp-mode-map
  (kbd "C-]") 'slime-edit-definition)

;; (defun deh-slime-completion-in-region (_fn completions start end)
;;   (funcall completion-in-region-function start end completions))

;; (advice-add
;;  'slime-display-or-scroll-completions
;;  :around #'deh-slime-completion-in-region)

(evil-add-command-properties #'slime-edit-definition :jump t)

(defun deh/slime-repl-mode-hook ()
  (evil-emacs-state t)
)

(add-hook 'slime-repl-mode-hook 'deh/slime-repl-mode-hook)

(provide 'deh-slime)
