(require 's)

(defun deh/util/get-leading-whitespace-count (beginning end)
  (interactive "r")
  (let* ((contents (buffer-substring-no-properties beginning end))
         (matches (s-match "\\`[ \t\n\r]+" contents)))
    (length (first matches))))

(defun deh/util/get-trailing-whitespace-count (beginning end)
  (interactive "r")
  (let* ((contents (buffer-substring-no-properties beginning end))
         (matches (s-match "[ \t\n\r]+\\'" contents)))
    (print (length (first matches)))
    ))

(defun deh/util/do-lines (start end command)
  "Run a command over all lines in region."
  (setq start (copy-marker start)
        end (copy-marker end))
  (save-excursion
    (goto-char start)
    (while (< (point) end)
  (message "word")
      (funcall command (line-beginning-position) (line-end-position))
      (forward-line 1))))

(provide 'deh-util)
