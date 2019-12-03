(require 'company)
(require 'flycheck)
(require 'editorconfig)
(require 'evil)
(require 'emmet-mode)

(evil-set-initial-state 'nxml-mode 'normal)
(evil-set-initial-state 'xml-mode 'normal)


(defun deh-xml-mode-hook ()
  "my xml mode hook"
  (company-mode t)
  (flycheck-mode t)
  (eldoc-mode t)
  (editorconfig-mode t)
  (emmet-mode t)
  (setq tab-width 4)
  (setq nxml-child-indent 4
        nxml-attribute-indent 4)
  (setq display-line-numbers 'relative))

(add-hook 'xml-mode-hook 'deh-xml-mode-hook)
(add-hook 'nxml-mode-hook 'deh-xml-mode-hook)

;; csproj files
(add-to-list 'auto-mode-alist '("\\.props\\'" . xml-mode))

(provide 'deh-xml)
