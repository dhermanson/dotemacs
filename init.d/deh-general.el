(setq scroll-margin 0) ; equivalent to vim's scrolloff
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)


;; (setq frame-title-format
;;           '("" invocation-name ": "
;;             (:eval
;;              (if (buffer-file-name)
;;                  (abbreviate-file-name (buffer-file-name))
;;                "%b"))))
(setq frame-title-format
          '((:eval
             (if (buffer-file-name)
                 (abbreviate-file-name (buffer-file-name))
               "%b"))))
 
(provide 'deh-general)
