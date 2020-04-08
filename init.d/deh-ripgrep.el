
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

(defun deh/projectile/ripgrep ()
  (interactive)
  (let* ((default-directory (f-canonical (if (projectile-project-p)
                                             ;; (projectile-complete-dir (projectile-project-root))
                                             (helm :sources (helm-build-sync-source "project dirs"
                                                              :candidates (mapcar #'f-relative  (cons
                                                                                                 (projectile-project-root)
                                                                                                 (mapcar #'expand-file-name (projectile-project-dirs (projectile-project-root)))))
                                                              :fuzzy-match t))
                                           (read-directory-name "Where to perform  search" ))))
         
         (input (read-from-minibuffer "Ripgrep search for: " (thing-at-point 'symbol)))
         (command (concat grep-command input)))
    (if (and input command)
        (grep command))))


(deh/projectile/ripgrep)

(provide 'deh-ripgrep)
