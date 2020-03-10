(require 'restclient)
(require 'evil)
(require 'company)

(evil-set-initial-state 'restclient-mode 'normal)

(defun deh-restclient-mode-hook ()
  "my restclient mode hook"
  (evil-surround-mode)
  (set (make-local-variable 'company-backends) '((company-dabbrev-code company-yasnippet)))
  )

(add-hook 'restclient-mode-hook 'deh-restclient-mode-hook)

(add-to-list 'auto-mode-alist '("\\.http$" . restclient-mode))

(provide 'deh-restclient)
