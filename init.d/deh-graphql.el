(require 'graphql-mode)
(require 'evil)
(require 'smartparens)

(evil-set-initial-state 'graphql-mode 'normal)

(defun deh/graphql-mode-hook ()
  (smartparens-mode t))

(add-hook 'graphql-mode-hook 'deh/graphql-mode-hook)

(add-to-list 'auto-mode-alist '("\\.graphqls\\'" . graphql-mode))

(provide 'deh-graphql)
