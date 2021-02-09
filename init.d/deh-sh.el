(require 'deh-repl)
(require 'evil)

(evil-set-initial-state 'sh-mode 'normal)

(defun deh-sh-mode-hook ()
  (setq deh-repl-enabled t)
  (set (make-local-variable 'company-backends) '((company-capf company-dabbrev-code company-files company-yasnippet)))
  (if (projectile-project-p)
      (setq deh-repl-process-name (concat (projectile-project-name) ":bash"))
    (setq deh-repl-process-name (concat default-directory ":bash")))
  
  (setq deh-repl-buffer-name (concat "*" deh-repl-process-name "*"))
  (setq deh-repl-program "zsh")

  (setq c-basic-offset 2)
  (setq tab-width 2)
  (setq sh-basic-offset 2)
  (setq sh-indentation 2)
  (setq sh-indent-after-continuation 'always)
  (setq sh-indent-for-continuation 0)
  ;; (setq sh-backslash-align nil)
  (setq evil-shift-width 2))

;; (defun deh-sh-mode-hook ()
;;   (deh-sh-set-local-vars))

(add-hook 'sh-mode-hook 'deh-sh-mode-hook)
;; (add-hook 'sh-mode-local-vars-hook 'deh-sh-set-local-vars)

(add-to-list 'auto-mode-alist '("\\.env.*" . sh-mode))

(provide 'deh-sh)
