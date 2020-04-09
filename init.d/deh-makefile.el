(require 'evil)

(evil-set-initial-state 'makefile-mode 'normal)

(defun deh-makefile-mode-hook ()
  "my makefile mode hook"
  (evil-surround-mode)
  (setq c-basic-offset 'set-from-style)
  (setq indent-tabs-mode t)
  (set (make-local-variable 'company-backends) '((company-yasnippet company-dabbrev-code))))


(add-hook 'makefile-mode-hook 'deh-makefile-mode-hook)

(add-to-list 'auto-mode-alist '("[Mm]akefile" . makefile-mode))

(provide 'deh-makefile)
