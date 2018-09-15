(require 'projectile)
(require 'f)

(defun deh-run-fzf ()
  (interactive)
  (let* ((directory (if (projectile-project-p) (projectile-project-root) "."))
         (file (shell-command-to-string (concat "~/.emacs.d/bin/tmux-split fzf " directory))))
    (unless (s-blank? file)
      (find-file (f-join directory file)))))

(provide 'deh-tmux)
