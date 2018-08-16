(require 'winum)
(winum-mode t)

(define-key global-map (kbd "H-0") 'winum-select-window-0)
(define-key global-map (kbd "H-1") 'winum-select-window-1)
(define-key global-map (kbd "H-2") 'winum-select-window-2)
(define-key global-map (kbd "H-3") 'winum-select-window-3)
(define-key global-map (kbd "H-4") 'winum-select-window-4)
(define-key global-map (kbd "H-5") 'winum-select-window-5)
(define-key global-map (kbd "H-6") 'winum-select-window-6)
(define-key global-map (kbd "H-7") 'winum-select-window-7)
(define-key global-map (kbd "H-8") 'winum-select-window-8)

(provide 'deh-winum)
