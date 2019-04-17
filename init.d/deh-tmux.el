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

;; this is where the new stuff begins

(defun my-make-tmux-session (name)
  "make a tmux session"
  (interactive "sSession name: ")
  (let ((cmd (concat "urxvt 2> /dev/null -e tmux new -s " name " zsh")))
    (start-process-shell-command "tmux-session" nil cmd)))

;; TODO: this function doesn't belong in this file
(defun my-get-region-or-current-line ()
  (if (eq (region-beginning) (region-end))
      (list (line-beginning-position) (line-end-position))
    (list (region-beginning) (region-end))))
 
(defun my-send-current-line-to-tmux-pane ()
  "Send the current line to the repl."
  (interactive)
  ;; (my-send-region-to-tmux-pane (line-beginning-position) (line-end-position))
  (emamux:send-keys (buffer-substring-no-properties (point-at-bol) (point-at-eol)) "repls:0")
  ;; (my-send-region-to-tmux-pane (point-at-bol) (point-at-eol))
  )

(defun my-send-region-to-tmux-pane (beg end)
  "Send region to a tmux pane"
  (interactive "r")
  ;; (interactive (my-get-region-or-current-line))
  (let ((input (buffer-substring-no-properties beg end)))
    (emamux:send-keys input "repls:0")
    ;; (my-send-text-to-tmux-pane "repls:0" input)
    ))

(defun my-send-text-to-tmux-pane (pane text)
  (emamux:send-keys text pane)
  ;; (process-file "tmux" nil "output" nil "send-keys" "-t" pane text "C-m")
  )




(provide 'deh-tmux)
;;; deh-tmux ends here
