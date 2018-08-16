(require 'ansi-color)

(defun deh-ansi-colorize-buffer ()
  (let ((buffer-read-only nil))
    (ansi-color-apply-on-region (point-min) (point-max))))

(add-hook 'compilation-filter-hook 'deh-ansi-colorize-buffer)

(provide 'deh-compilation)
