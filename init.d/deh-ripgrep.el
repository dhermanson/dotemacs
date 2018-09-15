(defun deh-ripgrep (s)
	(interactive "sRipgrep search for: ")
  (if (projectile-project-p)
	    (projectile-ripgrep s)
    (ripgrep-regexp s default-directory)))

(provide 'deh-ripgrep)
