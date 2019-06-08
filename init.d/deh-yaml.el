(require 'evil)
(require 'deh-util)

(evil-set-initial-state 'yaml-mode 'normal)

(defun deh-yaml-mode-hook ()
  (setq display-line-numbers 'relative)
  ;; (modify-syntax-entry ?_ "w")
  (flycheck-mode t)
  (setq evil-shift-width 2)
  (setq yaml-indent-offset 2)
  (setq c-basic-offset 2)
  (define-key yaml-mode-map "\C-m" 'newline-and-indent))

(add-hook 'yaml-mode-hook 'deh-yaml-mode-hook)

(defun deh/yaml/run-prettier-on-buffer ()
  (interactive)
  (message "running prettier on entire buffer...")

  (progn
    (let ((current-point (point)))
      (shell-command-on-region
       (point-min) (point-max)
       "prettier --parser=yaml"
       (buffer-name  (current-buffer)) t )
      (goto-char current-point))))

(defun deh/yaml/run-prettier-on-buffer ()
  (interactive)
  (message "running prettier on entire buffer...")
  (let* ((current-point (point))
         (current-buffer (current-buffer))
         (min-point (point-min))
         (max-point (point-max)))
    (if (eq 0 (shell-command-on-region min-point max-point "prettier --parser=yaml" "*prettier-stdout*" nil "*prettier-stderr*" nil))
        (with-current-buffer "*prettier-stdout*"
          (copy-to-buffer current-buffer (point-min) (point-max))))
    (goto-char current-point))
  nil)

;; (defun deh/yaml/run-prettier-on-region (beginning end)
;;   (interactive "r")
;;   (if (use-region-p)
;;       (progn
;;         ;; (deh/util/do-lines beginning end 'deh/print-lines-upcased)
;;         (let ((current-point (point))
;;               (leading-whitespace-count (deh/util/get-leading-whitespace-count beginning end))
;;               ;; (trailing-whitespace (deh/util/get-trailing-whitespace-count beginning end))
;;               )
;;           (message "running prettier on region...")
;;           (save-excursion
;;             (shell-command-on-region
;;              marked-beginning marked-end
;;              "prettier --parser=yaml"
;;              (buffer-name  (current-buffer)) t ))
;;           ;; (deh/util/do-lines marked-beginning marked-end '(lambda (line-start line-end)
;;           ;;                                                  (progn
;;           ;;                                                    (evil-beginning-of-line)
;;           ;;                                                    (insert (make-string leading-whitespace-count ? )))))
;;           ;; (deh/util/do-lines beginning end 'deh/print-lines-upcased)
;;           ;; (goto-char current-point)
          
;;           (string-insert-rectangle marked-beginning marked-end (make-string leading-whitespace-count ? ))
;;           ;; (indent-region beginning (- end trailing-whitespace) leading-whitespace)
;;           ))
;;     (message "not running prettier...use-region-p returned non-truthy value ")))



(defun deh/yaml/before-save ()
  (interactive)
  (when (eq major-mode 'yaml-mode) (deh/yaml/run-prettier-on-buffer)))

(add-hook 'before-save-hook 'deh/yaml/before-save)

;; (evil-define-key '(normal visual) yaml-mode-map
;;   (kbd "=") 'deh/yaml/run-prettier-on-buffer)


(require 'flycheck)

(flycheck-def-config-file-var flycheck-yamllintrc yaml-yamllint ".yamllint"
  :safe #'stringp)

  ;; :command ("yamllint" "-f" "parsable" source (config-file "-c" flycheck-yamllintrc))
(flycheck-define-checker yaml-yamllint
  "A YAML syntax checker using YAMLLint.
See URL `https://github.com/adrienverge/yamllint'."
  :command ("yamllint" "-f" "parsable" source (config-file "-c" flycheck-yamllintrc))
  :error-patterns
  ((error line-start (file-name) ":" line ":" column ": [error] " (message) line-end)
   (warning line-start (file-name) ":" line ":" column ": [warning] " (message) line-end))
  :modes yaml-mode)

;;;###autoload
(defun flycheck-yamllint-setup ()
  "Setup Flycheck YAMLLint integration."
  (interactive)

  (add-to-list 'flycheck-checkers 'yaml-yamllint))

;; doing this because i don't think my autoload annotation? is working...
(add-to-list 'flycheck-checkers 'yaml-yamllint)

(provide 'deh-yaml)
