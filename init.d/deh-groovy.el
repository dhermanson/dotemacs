(require 'smartparens)
(require 'company)
(require 'groovy-mode)

(defun deh-groovy-mode-hook ()
  "my groovy mode hook"
  (evil-surround-mode t)
  (smartparens-mode t)
  (set (make-local-variable 'company-backends) '((company-etags company-dabbrev-code))))

;; TODO: this was necessary in order to make etags work in groovy-mode
(add-to-list 'company-etags-modes 'groovy-mode)
;; TODO: this was necessary in order to make dabbrev-code work in groovy-mode
(add-to-list 'company-dabbrev-code-modes 'groovy-mode)

(add-hook 'groovy-mode-hook 'deh-groovy-mode-hook)

(provide 'deh-groovy)
