(require 'projectile)
(require 'ivy)

(defvar-local deh-buffer-commands nil
  "Commands local to the current buffer")

(defun deh-run-buffer-command ()
  (interactive)
  (if (null deh-buffer-commands)
      (print "No buffer local commands")
    (let* ((command-names (mapcar 'car deh-buffer-commands))
           (command-name (ivy-read "Action: " command-names))
           (command-name-symbol (intern command-name))
           (command (alist-get command-name-symbol deh-buffer-commands)))
      (funcall-interactively command))))

(define-key global-map (kbd "C-c l") 'deh-run-buffer-command)

;; (define-key evil-normal-state-map )
;; (define-key evil-normal-state-map )


(projectile-global-mode)

;; only use the topmost projectile project
(setq projectile-project-root-files '(".projectile"))
(setq projectile-project-root-files-bottom-up nil)
(setq projectile-project-root-files-top-down-recurring nil)
(setq projectile-project-root-files-functions '(projectile-root-top-down))

;; (setq projectile-switch-project-action 'projectile-run-eshell)
(setq projectile-switch-project-action 'projectile-dired)
(setq projectile-tags-backend 'etags-select-find-tag)
;; (setq projectile-tags-backend 'helm-gtags-select)

(projectile-register-project-type 'generic nil
                                  :compilation-dir "."
                                  :compile "make")


(provide 'deh-project)
