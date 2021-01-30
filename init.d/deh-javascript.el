;;; deh-javascript.el -- my javascript mode -*- lexical-binding: t; -*-
(require 'flycheck)
(require 'smartparens)
(require 'evil)
(require 'lsp-mode)



(evil-set-initial-state 'js-mode 'normal)


(defun deh-javascript-hook ()
  "my javascript hook"
  (setq js-indent-level 2)

  (company-mode t)
  (flycheck-mode t)
  (eldoc-mode t)
  (smartparens-mode t)
  (evil-surround-mode)

  (setq deh-repl-enabled t)
  (setq deh-repl-process-name "deh-node")
  (setq deh-repl-buffer-name "*deh-node*")
  (setq deh-repl-program "node")
  (setq deh-repl-program-args nil)
  )



(add-hook 'js-mode-hook 'deh-javascript-hook)
;; (flycheck-add-mode 'javascript-eslint 'js-mode)

(add-hook 'js-mode-hook 'deh-javascript-hook)
(add-hook 'js-mode-hook #'lsp)

(add-hook 'javascript-mode-hook 'deh-javascript-hook)
(add-hook 'javascript-mode-hook #'lsp)



(provide 'deh-javascript)
