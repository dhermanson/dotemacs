(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)

(defun deh-comint-mode-hook ()
  "my comint mode hook"
  (interactive)
  (setq comint-scroll-to-bottom-on-input "this")
  (setq comint-scroll-to-bottom-on-output "this"))

(add-hook 'comint-mode-hook 'deh-comint-mode-hook)

(provide 'deh-comint)
