(require 'syslog-mode)

(defun deh/syslog-mode-hook () 

  (setq truncate-lines nil))

(add-hook 'syslog-mode-hook #'deh/syslog-mode-hook)

(add-to-list 'auto-mode-alist '("\\.syslog$" . syslog-mode))

(provide 'deh-syslog)
