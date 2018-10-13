(require 'deh-repl)

(evil-set-initial-state 'sh-mode 'normal)

(defun deh-sh-set-local-vars ()
  (setq deh-repl-enabled t)
  (if (projectile-project-p)
      (setq deh-repl-process-name (concat (projectile-project-name) ":bash"))
    (setq deh-repl-process-name (concat default-directory ":bash")))
  
  (setq deh-repl-buffer-name (concat "*" deh-repl-process-name "*"))
  (setq deh-repl-program "zsh")
  (setq deh-repl-program-args nil))

(defun deh-sh-mode-hook ()
  (deh-sh-set-local-vars))

(add-hook 'sh-mode-hook 'deh-sh-mode-hook)
(add-hook 'sh-mode-local-vars-hook 'deh-sh-set-local-vars)

(add-to-list 'auto-mode-alist '("\\.env.*" . sh-mode))

(provide 'deh-sh)
