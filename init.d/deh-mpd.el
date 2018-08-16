(defun deh-mpd-pause ()
  (interactive)
  (shell-command "mpc pause"))

(defun deh-mpd-play ()
  (interactive)
  (shell-command "mpc play"))

(define-key global-map (kbd "C-c m s") 'deh-mpd-pause)
(define-key global-map (kbd "C-c m p") 'deh-mpd-play)

(provide 'deh-mpd)
