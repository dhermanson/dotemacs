(defun deh-shell-mode-hook ()
  "my shell mode hook"
  (buffer-disable-undo))

(add-hook 'shell-mode-hook 'deh-shell-mode-hook)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(provide 'deh-shell)
