(require 'smartparens)
(require 'flycheck)

(add-to-list 'auto-mode-alist '("\\.avsc\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

(defun deh-json-mode-hook ()
  "my json mode hook"
  (smartparens-mode 1)
  (flycheck-mode 1)
  (evil-surround-mode t)
  (setq js-indent-level 2))

(add-hook 'json-mode-hook 'deh-json-mode-hook)

(provide 'deh-json)
