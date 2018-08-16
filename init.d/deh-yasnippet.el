(require 'yasnippet)

(add-hook 'yas-minor-mode-hook
          (lambda ()
            (yas-activate-extra-mode 'fundamental-mode)))

(provide 'deh-yasnippet)
