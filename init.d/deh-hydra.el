(require 'hydra)


(defhydra deh/hydras/windows (nil nil)
  "other window"
  ("o" #'other-window "next window")
  ("O" (lambda () (interactive) (other-window -1)) "previous window"))

(define-key global-map (kbd "C-x o") 'deh/hydras/windows/other-window)

(provide 'deh-hydra)
