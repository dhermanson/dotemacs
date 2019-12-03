(defun deh/open-current-buffer-in-new-gui-frame ()
  (interactive)
  (let ((file-name (buffer-file-name))
        (server-flag (if server-name
                         (concat " -s " server-name )
                       ""))
        (start-process-shell-command "open-in-gui"
                                     nil
                                     (concat "emacsclient " server-flag " -c " file-name)))))

(provide 'deh-gui)
