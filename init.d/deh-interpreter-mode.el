(require 'js2-mode)

(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(add-to-list 'interpreter-mode-alist '("nodejs" . js2-mode))

(provide 'deh-interpreter-mode)
