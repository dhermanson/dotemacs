(defun deh/buffer-menu-mode-hook ()
  (Buffer-menu-toggle-files-only 1))

(add-hook 'buffer-menu-mode-hook 'deh/buffer-menu-mode-hook)

(provide 'deh-buffer-menu)
