(require 'vterm)


;; (defun deh/hooks/vterm-mode-hook ()
;;   (interactive)

;;   ())

(define-key vterm-mode-map (kbd "C-h") 'vterm-send-C-h)




(provide 'deh-vterm)
