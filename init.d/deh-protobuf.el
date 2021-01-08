(require 'smartparens)

(defun deh/mode-hooks/protobuf ()
  "my protobuf mode hook"
  (setq display-line-numbers 'relative)
  ;; (setq display-line-numbers 'nil)
  (smartparens-mode 1)
  )

(add-hook 'protobuf-mode-hook 'deh-prog-mode-hook)

(provide 'deh-protobuf)
