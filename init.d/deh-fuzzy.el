(defun deh-projectile-fzf-find-file ()
  (interactive)
  (if (projectile-project-p)
      (let ((default-directory (projectile-project-root)))
        (start-process-shell-command "fzf-file-finder" nil
                                     (concat "EMACS_SERVER_NAME=" server-name
                                             " urxvtc -geometry 125x40 -name urxvtfloat -e 'deh-find-file' 2> /dev/null")))))

;; TODO: don't do this in gui environments...instead, do above
;; (defun deh-projectile-fzf-find-file ()
;;   (interactive)
;;   (if (projectile-project-p)
;;       (let ((default-directory (projectile-project-root)))
;;         (start-process-shell-command "fzf-file-finder" nil
;;                                      (concat "tmux splitw -l 15 'EMACS_SERVER_NAME=" server-name
;;                                              " deh-find-file'")))))

;; (defun deh-projectile-fzf-find-file ()
;;   (interactive)
;;   (if (projectile-project-p)
;;       (let ((default-directory (projectile-project-root)))
;;         (start-process-shell-command "fzf-file-finder" nil "urxvt -geometry 125x40 -name urxvtfloat -e deh-tmux-find-file 2> /dev/null"))))


(defun deh-projectile-fzf-result ()
  (interactive)
  (if (projectile-project-p)
      (let ((default-directory (projectile-project-root)))
        (print (shell-command-to-string "deh-find-file")))))

(provide 'deh-fuzzy)
