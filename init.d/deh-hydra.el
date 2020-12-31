(require 'hydra)


(defhydra deh/hydras/windows (global-map "C-c w")
  "windows"
  ("o" #'other-window "next window")
  ("O" (lambda () (interactive) (other-window -1)) "previous window")
  ;; ("o" #'delete-other-windows "delete other windows")

  ;; create windows
  ("s" #'split-window-below "split window below")
  ("v" #'split-window-right "split window right")

  ;; evil windows
  ("h" #'deh-windmove-create-or-select-window-left "window left")
  ("j" #'deh-windmove-create-or-select-window-down "window down")
  ("k" #'deh-windmove-create-or-select-window-up "window up")
  ("l" #'deh-windmove-create-or-select-window-right "window right")
  ("H" #'evil-window-move-far-left "move window to far left")
  ("J" #'evil-window-move-very-bottom "move window to very bottom")
  ("K" #'evil-window-move-very-top "move window to very top")
  ("L" #'evil-window-move-far-right "move window to far right")
  ("c" #'evil-window-delete "delete window")

  ;; quit
  ("C-g" nil "quit")
  ("g" nil "quit")
  ("q" nil "quit"))



(define-key global-map (kbd "C-x o") 'deh/hydras/windows/other-window)


(provide 'deh-hydra)
