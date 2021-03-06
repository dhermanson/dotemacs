(require 'with-editor)

;; os-x specific settings
(defun deh-screenshot (&optional file)
    (interactive
     (let ((filename (read-file-name "Enter file: ")))
       (list filename)))
    (print "implement when not on mac"))

(when (string= system-type "darwin")
  (setq dired-use-ls-dired t
        insert-directory-program "/usr/local/bin/gls"
        dired-listing-switches "-aBhl --group-directories-first")

  (setq ns-function-modifier 'hyper)
  (setq mac-function-modifier 'hyper)
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'super)
  ;; (menu-bar-mode 1)
  ;; (exec-path-from-shell-initialize)
  
  ;; Fnacy titlebar for MacOS
  ;; (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  ;; (add-to-list 'default-frame-alist '(ns-appearance . dark))
  ;; (setq ns-use-proxy-icon nil)
  ;; (setq frame-title-format nil)

  (setq with-editor-emacsclient-executable "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient")

  (setq locate-command "glocate")

  (defun deh-screenshot (&optional file)
    (interactive
     (let ((filename (read-file-name "Enter file: ")))
       (list filename)))
    (shell-command (concat "screencapture -s " file))
    file)

  (define-key global-map (kbd "H-s") 'deh-screenshot)
  )

(provide 'deh-macos)
