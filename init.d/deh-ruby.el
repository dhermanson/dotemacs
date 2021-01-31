(require 'smartparens)
(require 'smartparens-config)
(require 'smartparens-ruby)
(require 'robe)
(require 'company)
(require 'evil)
(require 'lsp)

(evil-set-initial-state 'ruby-mode 'normal)

;; re-evaluate how you want to do the repl setup for ruby
;; spinning up a new repl is as simple as
;; (run-ruby-new "pry" "my-new-repl")
;; then...*my-new-repl* is the name of the buffer

(defun deh/my-ruby-mode-hook ()
  "my ruby mode hook"
  ;; (robe-mode)
  (smartparens-mode)
  (show-smartparens-mode)
  (setq company-idle-delay nil)
  ;; (set (make-local-variable 'company-backends) '(( company-robe )))
  (set (make-local-variable 'company-backends) '(( company-capf )))
  (setq inf-ruby-default-implementation "pry")
  ;; (setq inf-ruby-default-implementation "irb")
  ;; turn flycheck mode on
  (flycheck-mode)
  ;; (lsp-mode 0)

  (setq deh-repl-enabled t)
  (setq deh-repl-insert-style 'b)
  (setq deh-repl-process-name "deh-ruby")
  ;; (setq deh-repl-buffer-name "*deh-ruby*")
  ;; (setq deh-repl-buffer-name "*deh-ruby*")
  (setq deh-repl-buffer-name "*deh-ruby*")
  ;; (setq deh-repl-program "pry")
  (setq deh-repl-program "irb")
  (setq deh-repl-program-args nil))

(add-hook 'ruby-mode-hook 'deh/my-ruby-mode-hook)

;; (add-hook 'ruby-mode-hook #'lsp)

(add-to-list 'auto-mode-alist '("Brewfile" . ruby-mode))

(provide 'deh-ruby)
