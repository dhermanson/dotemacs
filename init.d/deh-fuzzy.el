(defun deh-projectile-fzf-find-file ()
  (interactive)
  (if (projectile-project-p)
      (let ((default-directory (projectile-project-root)))
        (start-process-shell-command "fzf-file-finder" nil "urxvt -name urxvtfloat -e 'deh-find-file' 2> /dev/null"))))

(defun deh-projectile-fzf-result ()
  (interactive)
  (if (projectile-project-p)
      (let ((default-directory (projectile-project-root)))
        (print (shell-command-to-string "deh-find-file")))))

(provide 'deh-fuzzy)
