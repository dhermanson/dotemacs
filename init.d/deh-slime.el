(require 'slime)
(require 'evil)

(setq inferior-lisp-program "sbcl")
(evil-set-initial-state 'sime-repl-mode 'emacs)

(provide 'deh-slime)
