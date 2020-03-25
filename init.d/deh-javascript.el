;;; deh-javascript.el -- my javascript mode -*- lexical-binding: t; -*-
(require 'flycheck)
(require 'smartparens)
(require 'evil)
(require 'rjsx-mode)
(require 'js2-mode)

;; look here https://github.com/magnars/.emacs.d/blob/master/settings/setup-js2-mode.el


(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(evil-set-initial-state 'js2-mode 'normal)

;; (add-hook 'javascript-mode 'js2-mode-reset)

;; (evil-set-initial-state 'rjsx-mode 'normal)

;; Let flycheck handle all errors and warnings
(setq-default js2-mode-show-parse-errors nil)
(setq-default js2-mode-show-strict-warnings nil)
;; (setq-default js2-strict-missing-semi-warning nil)
;; (setq-default js2-strict-trailing-comma-warning t) ;; jshint does not warn about this now for some reason


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



(add-hook 'js2-mode-hook 'deh-javascript-hook)
(flycheck-add-mode 'javascript-eslint 'js2-mode)

(defun deh-rjsx-hook ()
  "my rjsx hook"
  (setq js-indent-level 2)

  (emmet-mode t)
  (tide-setup)
  (tide-mode t)
  (smartparens-mode t)
  (eldoc-mode t)
  ;; (setq flycheck-checkers '(jsx-tide))
  
  ;; (set (make-local-variable 'company-backends) '((company-tern company-yasnippet)))
  )

(with-eval-after-load 'rjsx-mode
  (define-key rjsx-mode-map "<" nil)
  (define-key rjsx-mode-map (kbd "C-d") nil)
  (define-key rjsx-mode-map ">" nil))

;; (add-hook 'rjsx-mode-hook 'deh-rjsx-hook)

(provide 'deh-javascript)
