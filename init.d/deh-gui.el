(defun deh/open-file-in-new-gui-frame (file-name)
  (interactive "fOpen file in gui: ")
  (let ((server-flag (if server-name
                         (concat " -s " server-name )
                       "")))
    (start-process-shell-command "open-in-gui"
                                 nil
                                 (concat "emacsclient " server-flag " -c " file-name))))

(defun deh/open-magit-in-new-gui-frame ()
  (interactive)
    (start-process-shell-command "open-in-gui"
                                 nil
                                 "magit"))

(provide 'deh-gui)
