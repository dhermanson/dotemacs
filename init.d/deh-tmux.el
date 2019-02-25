;;;  package -- Summary

(require 'projectile)
(require 'f)
(require 'emamux)

;;; Code:

(defun deh-send-current-line-to-tmux ()
  "Send the current line to tmux."
  (interactive)
  (let* ((line (s-trim-right (thing-at-point 'line t))))
    (emamux:send-region (point-at-bol) (point-at-eol))))

(defun deh-send-region-to-tmux (start end)
  "Send the current region to tmux"
  (interactive "r")
  (emamux:send-region start end)
  (evil-exit-visual-state))

(defun deh-get-tmux-panes ()
  "Get a list of tmux panes"
  (interactive)
  (s-split
   "\n"
   (s-chomp
    (shell-command-to-string
     "tmux list-panes -as -F \"#{session_name}:#{window_name}:#{pane_index}\""))))

(provide 'deh-tmux)
;;; deh-tmux ends here
