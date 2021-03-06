(require 's)
(require 'evil)
(require 'expand-region)

(setenv "NODE_NO_READLINE" "0")
(setenv "PAGER" "cat")

(defvar-local deh-repl-enabled "is a repl enabled in this buffer")
(defvar-local deh-repl-insert-style 'a "the style of insert")
(defvar-local deh-repl-process-name "the name of the repl")
(defvar-local deh-repl-buffer-name "the name of the repl buffer")
(defvar-local deh-repl-program "the repl program to run")

;; TODO: instead of defining this function here, take in functions for
;;       changing to repl and executing (actually calling (comint-send-input)) like here
;;       https://github.com/kaz-yos/eval-in-repl/blob/master/eval-in-repl.el#L210
(defun deh-create-repl (&optional switch)
  "create a repl"
  (interactive)
  (let* ((current-window (selected-window))
         (current-buffer (current-buffer))
         ;; (repl-buffer (get-buffer-create deh-repl-buffer-name))
         ;; (args (list deh-repl-process-name
         ;;                      repl-buffer
         ;;                      deh-repl-program
         ;;                      nil))
         )
    (switch-to-buffer-other-window current-buffer)
    (ansi-term deh-repl-program deh-repl-process-name )
    (switch-to-buffer-other-window current-buffer)
    (select-window current-window)
    ;; (apply 'make-comint-in-buffer args)
    ;; (if switch
    ;;     (progn
    ;;       (switch-to-buffer-other-window repl-buffer)
    ;;       (select-window current-window)))
    ))

;; https://lists.gnu.org/archive/html/help-gnu-emacs/2009-09/msg00411.html
(defun deh-send-current-line-to-repl ()
  "Send the current line to the repl."
  (interactive)
  (deh-send-region-to-repl (line-beginning-position) (line-end-position)))

(defun deh-send-region-to-repl (start end)
  "Send a region to the repl (START END)."
  (interactive "r")
  ;; (progn
  ;;   ;; (process-send-region deh-repl-buffer-name start end)
  ;;   ;; (process-send-string deh-repl-buffer-name "\n")
  ;;   (comint-send-region deh-repl-buffer-name start end)
  ;;   (comint-send-string deh-repl-buffer-name "\n")
  ;;   (evil-exit-visual-state))
  (save-window-excursion
    (let* (;; Assign the current buffer
           (script-window (selected-window))
           (region-string (buffer-substring-no-properties start end)))
      ;; Change other window to REPL
      ;; (funcall fun-change-to-repl)
      ;; (switch-to-buffer-other-window deh-repl-buffer-name)
      ;; Move to end of buffer
      ;; Insert the string
      ;; the s-trim-right is my addition
      ;; (insert (s-trim-right region-string))
      (with-current-buffer deh-repl-buffer-name
        (goto-char (point-max))
        ;; (term-interrupt-subjob)
        (comint-send-string (deh-repl-process) "")
        ;; (comint-send-string (deh-repl-process) region-string)
        (comint-send-string (deh-repl-process) (if (s-ends-with? "\n" region-string)
                                                   region-string
                                                 (concat region-string "\n"))
                            )
        ;; (if (s-ends-with? "\n" region-string)
        ;;     (message "ends in newline"))
        ;; (read-only-mode 0)
        ;; (comint-send-input)
        ;; ;; (read-only-mode 1)
        )
      ;; (comint-send-region (deh-repl-process) start end)
      ;; (insert region-string)
      ;; Execute
      ;; (funcall fun-execute)
      ;; Come back to the script
      ;; (select-window script-window)
      ;; Deactivate selection explicitly (necessary in Emacs 25)
      (er/contract-region 0)
      ;; (deactivate-mark)
      ;; (evil-exit-visual-state)
      ;; Return nil (this is a void function)
      nil)
    )

  )

(defun deh-restart-repl ()
  (interactive)
  (progn
    (deh-kill-repl)
    (deh-focus-repl-in-other-window))
  ;; (let* ((buffer (deh-repl-buffer))
  ;;        (process (deh-repl-process))
  ;;        (switch-on-create (null buffer)))
    
  ;;   (if process
  ;;       (progn
  ;;         (kill-process process)
  ;;         (sleep-for 0.5)))

  ;;   (if buffer
  ;;       (with-current-buffer buffer
  ;;         (erase-buffer)
  ;;         (goto-char (point-max))))
    
  ;;   (deh-create-repl switch-on-create))
  )

(defun deh-kill-repl ()
  (interactive)
  (let* ((buffer (deh-repl-buffer))
         (process (deh-repl-process)))
    (if process
        (progn
          (kill-process process)
          
          (sleep-for 0.2)
          (kill-buffer buffer)))

    ;; (if buffer
    ;;     (progn
    ;;       (delete-window (get-buffer-window buffer))
    ;;       (kill-buffer buffer)))
    ))

(defun deh-focus-repl-in-other-window ()
  (interactive)
  (let ((current-window (selected-window)))
    
    (switch-to-buffer-other-window (deh-repl-buffer))
    (select-window current-window)))

(defun deh-repl-buffer ()
  (get-buffer deh-repl-buffer-name))

(defun deh-repl-process ()
  (get-buffer-process deh-repl-buffer-name))

;; advice
(defun deh-ensure-repl-enabled (orig-fun &rest args)
  "ensure that the repl is enabled in this buffer"
  (if (and deh-repl-enabled
           deh-repl-process-name
           deh-repl-buffer-name
           deh-repl-program)
      (apply orig-fun args)
    (print "repl not enabled in buffer")))

(defun deh-ensure-repl-started (orig-fun &rest args)
  "ensure that the repl is started"
  (let* ((buffer-exists (deh-repl-buffer))
         (process-exists-in-buffer (deh-repl-process)))
    (if buffer-exists
        (unless process-exists-in-buffer
          (deh-create-repl))
      (deh-create-repl t)))
  (apply orig-fun args))

;; before sending a line, make sure the repl has been started
(advice-add 'deh-send-current-line-to-repl :around 'deh-ensure-repl-started)
(advice-add 'deh-send-region-to-repl :around 'deh-ensure-repl-started)

;; before ensuring the repl has been started, make sure the repl is enabled
(advice-add 'deh-ensure-repl-started :around 'deh-ensure-repl-enabled)

;; ensure repl started before switching focus in other window
(advice-add 'deh-focus-repl-in-other-window :around 'deh-ensure-repl-started)

(provide 'deh-repl)
