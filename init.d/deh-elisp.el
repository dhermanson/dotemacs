(require 'company)
(require 'paredit)

(defun deh-elisp-mode-hook ()
  "my elisp mode hook"
  (paredit-mode t)
  (flycheck-mode 1)
  (setq company-idle-delay nil)
  (setq company-backends '((company-elisp company-yasnippet company-files))))

(add-hook 'emacs-lisp-mode-hook 'deh-elisp-mode-hook)

(provide 'deh-elisp)
