(require 'flycheck)
(require 'smartparens)
(require 'evil)
(require 'rjsx-mode)

;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
(evil-set-initial-state 'js2-mode 'normal)

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))
(evil-set-initial-state 'rjsx-mode 'normal)


(defun deh-javascript-hook ()
  "my javascript hook"
  (setq js-indent-level 2)

  (company-mode t)
  (flycheck-mode t)
  (eldoc-mode t)
  (smartparens-mode t)
  ;; (set (make-local-variable 'company-backends) '((company-tern company-yasnippet)))
  (evil-surround-mode)

  (setq deh-repl-enabled t)
  (setq deh-repl-process-name "deh-node")
  (setq deh-repl-buffer-name "*deh-node*")
  (setq deh-repl-program "node")
  (setq deh-repl-program-args nil)
  ;; (setq deh-repl-program-args (list (concat (getenv "HOME") "/node_repl.js")))
  )



(add-hook 'js2-mode-hook 'deh-javascript-hook)

(defun deh-rjsx-hook ()
  "my rjsx hook"
  (setq js-indent-level 2)

  ;; (tern-mode nil)


  ;; (eldoc-mode +1)
  (emmet-mode t)
  (tide-setup)
  ;; (unless (tide-current-server)
  ;;   (tide-restart-server))
  (tide-mode t)
  (smartparens-mode t)
  (eldoc-mode t)
  (setq flycheck-checkers '(jsx-tide))
  ;; (set (make-local-variable 'company-backends) '((company-tern company-yasnippet)))
  )

(with-eval-after-load 'rjsx-mode
  (define-key rjsx-mode-map "<" nil)
  (define-key rjsx-mode-map (kbd "C-d") nil)
  (define-key rjsx-mode-map ">" nil))

(add-hook 'rjsx-mode-hook 'deh-rjsx-hook)

(provide 'deh-javascript)
