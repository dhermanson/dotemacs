(require 'web-mode)
(require 'company)
(require 'company-web-html)
(require 'company-css)
(require 'evil)
(require 'emmet-mode)

(evil-set-initial-state 'web-mode 'normal)

(defun deh-web-mode-hook ()
  "my web mode hook"
  (company-mode t)
  (emmet-mode t)
  (emmet-preview-mode 0)

  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  
  (set (make-local-variable 'company-backends) '((company-web-html
						  company-css))))

(add-hook 'web-mode-hook 'deh-web-mode-hook)

(add-to-list 'auto-mode-alist '("\\.blade.php" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache" . web-mode))

(provide 'deh-web)
