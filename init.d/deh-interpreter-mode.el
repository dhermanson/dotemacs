; (require 'js-mode)

(add-to-list 'interpreter-mode-alist '("node" . js-mode))
(add-to-list 'interpreter-mode-alist '("nodejs" . js-mode))

(provide 'deh-interpreter-mode)
