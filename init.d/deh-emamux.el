;;; Code
(require 'emamux)

(defun deh/emamux/send-current-line ()
  "Send the current line to emamux."
  (interactive)
  (emamux:send-region (line-beginning-position) (line-end-position)))

(defun deh/emamux/unset-parameters ()
  (interactive)
  (emamux:unset-parameters))

(defun deh/emamux/set-repl ()
  (interactive)
  ;; (deh/emamux/unset-parameters)
  ;; (setq emamux:session "repls")
  (emamux:set-parameters)
  ;; (emamux:set-parameter-window)
  ;; (emamux:set-parameter-pane)
  )

(provide 'deh-emamux)
