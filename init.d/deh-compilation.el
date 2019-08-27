(require 'ansi-color)

(defun deh-ansi-colorize-buffer ()
  (let ((buffer-read-only nil))
    (ansi-color-apply-on-region (point-min) (point-max))))

(add-hook 'compilation-filter-hook 'deh-ansi-colorize-buffer)

;; (add-to-list 'auto-mode-alist '("\\.compilation\\.*" . compilation-mode))
(add-to-list 'auto-mode-alist '("\\.grep.result$" . grep-mode))
;; (setq auto-mode-alist nil)

(provide 'deh-compilation)
