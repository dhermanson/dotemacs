(defun deh-ripgrep (s)
	(interactive "sRipgrep search for: ")
  (if (projectile-project-p)
	    (projectile-ripgrep s)
    (ripgrep-regexp s default-directory)))

(defun deh/projectile/grep ()
  (interactive)
  (let ((default-directory (if (projectile-project-p)
                               (projectile-project-root)
                             default-directory)))
    (call-interactively 'grep)))

(provide 'deh-ripgrep)
