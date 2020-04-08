
(defun deh-ripgrep (s)
	(interactive "sRipgrep search for: ")
  (if (projectile-project-p)
	    (projectile-ripgrep s)
    (ripgrep-regexp s default-directory)))

;; (defun deh/projectile/grep ()
;;   (interactive)
;;   (let ((default-directory (if (projectile-project-p)
;;                                (projectile-project-root)
;;                              default-directory)))
;;     (call-interactively 'grep)))

(defun deh/projectile/grep ()
  (interactive)
  (let* ((default-directory (if (projectile-project-p)
                         ;; (projectile-complete-dir (projectile-project-root))
                         (f-full (helm :sources (helm-build-sync-source "project dirs"
                                                  :candidates  (cons
                                                                (f-relative (projectile-project-root))
                                                                (mapcar
                                                                 (lambda (path)
                                                                   (f-relative (f-join
                                                                                (projectile-project-root) path)))
                                                                 (projectile-project-dirs (projectile-project-root))))
                                                  :fuzzy-match t))) 
                       (read-directory-name "Where to perform  search" )))
         
         (input (read-from-minibuffer "Ripgrep: " ))
         ;; (input (read-from-minibuffer "Ripgrep search for: " (thing-at-point 'symbol)))
         (command (concat grep-command input)))
    (if (and input command)
        (grep command))))

(provide 'deh-ripgrep)
