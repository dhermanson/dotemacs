(require 'evil)
(require 'evil-matchit)

(setq evil-default-state 'emacs)
(setq evil-disable-insert-state-bindings t)
(setq evil-insert-state-cursor '(bar . 2))
;; (setq evil-insert-state-cursor '((bar . 2) "white"))
;; (setq evil-insert-state-cursor 'box)
;; (setq evil-insert-state-cursor 'bar)

(require 'ace-jump-mode)
(require 'avy)
(require 'evil-surround)
(require 'evil)
(require 'evil-leader)
(require 'evil-numbers)
(require 'evil-commentary)
(require 'company)
;; (require 'treemacs)
(require 'deh-repl)
;; (require 'neotree)
(require 'deh-tmux)
(require 'emamux)
(require 'haskell)
(require 'counsel)
(require 'jar-manifest-mode)
(require 'key-chord)
(require 'expand-region)
(require 'deh-emamux)
(key-chord-mode 1)

(evil-commentary-mode)

(setq evil-visual-region-expanded 1)

(global-evil-matchit-mode t)
(evil-mode 1)
(global-evil-surround-mode t)
(evil-set-initial-state 'bat-mode 'normal)
(evil-set-initial-state 'Info-mode 'emacs)
(evil-set-initial-state 'conf-mode 'normal)
(evil-set-initial-state 'dired-mode 'emacs)
(evil-set-initial-state 'fundamental-mode 'normal)
(evil-set-initial-state 'syslog-mode 'normal)
(evil-set-initial-state 'terraform-mode 'normal)
(evil-set-initial-state 'nginx-mode 'normal)
(evil-set-initial-state 'text-mode 'normal)
(evil-set-initial-state 'compilation-mode 'emacs)
(evil-set-initial-state 'comint-mode 'emacs)
(evil-set-initial-state 'Man-mode 'emacs)
(evil-set-initial-state 'dockerfile-mode 'normal)
(evil-set-initial-state 'elisp-mode 'normal)
(evil-set-initial-state 'emacs-lisp-mode 'normal)
(evil-set-initial-state 'jar-manifest-mode 'normal)
(evil-set-initial-state 'eshell-mode 'emacs)
(evil-set-initial-state 'fsharp-mode 'normal)
(evil-set-initial-state 'protobuf-mode 'normal)
(evil-set-initial-state 'python-mode 'normal)
(evil-set-initial-state 'c-mode 'normal)
(evil-set-initial-state 'vimrc-mode 'normal)
(evil-set-initial-state 'groovy-mode 'normal)
(evil-set-initial-state 'go-mode 'normal)
(evil-set-initial-state 'haskell-mode 'normal)
(evil-set-initial-state 'markdown-mode 'normal)
(evil-set-initial-state 'help-mode 'emacs)
(evil-set-initial-state 'java-mode 'normal)
(evil-set-initial-state 'sql-mode 'normal)

(evil-set-initial-state 'json-mode 'normal)
(evil-set-initial-state 'kotlin-mode 'normal)
(evil-set-initial-state 'php-mode 'normal)
(evil-set-initial-state 'perl-mode 'normal)
(evil-set-initial-state 'feature-mode 'normal)
(evil-set-initial-state 'reb-mode 'emacs)
(evil-set-initial-state 'shell-mode 'emacs)
(evil-set-initial-state 'undo-tree-visualizer-mode 'emacs)

(defvar deh/evil-leader-map (make-sparse-keymap)
  "Keymap for \"leader key\" shortcuts.")
(define-key evil-normal-state-map (kbd "SPC") deh/evil-leader-map)
(define-key deh/evil-leader-map ";" 'ace-jump-char-mode)
;; (define-key deh/evil-leader-map ";" 'avy-goto-char)
;; (define-key deh/evil-leader-map (kbd "SPC") 'avy-goto-char)
;; (define-key deh/evil-leader-map ";" 'avy-goto-word-1)
(define-key deh/evil-leader-map "p" 'projectile-command-map)
;; (define-key deh/evil-leader-map "l" 'deh-helm-imenu)
(define-key deh/evil-leader-map "l" 'counsel-imenu)
;; (define-key deh/evil-leader-map "l" 'helm-imenu)
;; (define-key deh/evil-leader-map "k" 'helm-etags-select)
(define-key deh/evil-leader-map "k" 'counsel-etags-list-tag)
;; (define-key deh/evil-leader-map "l" 'counsel-imenu)
;; (define-key deh/evil-leader-map "f" 'helm-projectile-find-file)
(define-key deh/evil-leader-map "f" 'counsel-projectile-find-file)
;; (define-key deh/evil-leader-map "rr" 'deh-restart-repl)
;; (define-key deh/evil-leader-map "rk" 'deh-kill-repl)
(define-key deh/evil-leader-map "ro" 'deh-focus-repl-in-other-window)
;; (define-key deh/evil-leader-map "ro" 'emamux:split-window-horizontally)
(define-key deh/evil-leader-map "to" 'deh/emamux/set-repl)

(evil-define-key nil deh/evil-leader-map "gw" 'magit-stage-file)
(evil-define-key nil deh/evil-leader-map "gdf" 'magit-diff-buffer-file)
(evil-define-key nil deh/evil-leader-map "gdb" 'magit-diff-buffer-file)
(evil-define-key nil deh/evil-leader-map "gdu" 'magit-diff-unstaged)
(evil-define-key nil deh/evil-leader-map "gds" 'magit-diff-staged)
(evil-define-key nil deh/evil-leader-map "gs" 'magit-status)
(evil-define-key nil deh/evil-leader-map "gb" 'magit-blame)
(evil-define-key nil deh/evil-leader-map "gc" 'magit-branch-popup)
(evil-define-key nil deh/evil-leader-map "gla" 'magit-log-all)
(evil-define-key nil deh/evil-leader-map "glb" 'magit-log-buffer-file)
(evil-define-key nil deh/evil-leader-map "gtm" 'git-timemachine)
;; (evil-define-key nil deh/evil-leader-map "a" 'deh-ripgrep)
(evil-define-key nil deh/evil-leader-map "a" 'deh/projectile/grep)

;; (define-key deh/evil-leader-map "f" 'counsel-projectile-find-file)

;; key chords
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

(defun deh/tmux/fzf-projectile-find-file ()
  (interactive)
  (let ((default-directory (projectile-project-root)))
    (shell-command (concat  "tmux splitw zsh --no-globalrcs --no-rcs -ic 'deh-find-file " server-name "'")
                   )
    ;; (if (or (not server-name)
    ;;         (s-equals? server-name "server"))
    ;;     (helm-projectile-find-file)
    ;;   )
    
    ))
(evil-define-key nil evil-normal-state-map
  ;; (kbd ";") 'evil-ex
  ;; (kbd ":") 'evil-repeat-find-char
  (kbd "C-=") 'er/expand-region
  (kbd "] q") 'next-error
  (kbd "[ q") 'previous-error
  (kbd "] c") 'diff-hl-next-hunk
  (kbd "[ c") 'diff-hl-previous-hunk
  (kbd "M-b") 'counsel-projectile-switch-to-buffer
  ;; (kbd "M-b") 'helm-projectile-switch-to-buffer
  (kbd "Q") (kbd "@q") ;; this is amazing! I can define a key that presses other keys!
  ;; (kbd "M-b") 'counsel-projectile-switch-to-buffer
  ;; (kbd "M-f") 'helm-projectile-find-file
  ;; (kbd "M-f") '(lambda ()
  ;;                (interactive)
  ;;                (let ((default-directory (projectile-project-root)))
  ;;                  (shell-command (concat  "tmux splitw zsh --no-globalrcs --no-rcs -ic 'deh-find-file " server-name "'")
  ;;                                 )
  ;;                  ;; (if (or (not server-name)
  ;;                  ;;         (s-equals? server-name "server"))
  ;;                  ;;     (helm-projectile-find-file)
  ;;                  ;;   )
  
  ;;                                 ))
  ;; TODO: make this async? call-process?
  ;; (shell-command "tmux splitw fish -ic fzf")))
  ;; (shell-command (concat  "tmux neww fish -ic 'deh-find-file " server-name "'"))))
  ;; (shell-command (concat  "tmux splitw fish -ic 'deh-find-file " server-name "'"))))
  ;; (shell-command "tmux splitw zsh --no-globalrcs --no-rcs -ic fzf")))
  ;; (shell-command (concat "tmux neww zsh -ic 'deh-find-file " server-name "'"))))
  ;; (shell-command (concat "tmux splitw zsh --no-globalrcs -ic 'deh-find-file " server-name "'"))))
  ;; (kbd "M-f") 'deh/tmux/fzf-projectile-find-file
  (kbd "M-e") 'make-frame-command
  ;; (kbd "M-f") 'deh-projectile-fzf-find-file
  (kbd "M-f") 'counsel-projectile-find-file
  ;; (kbd "M-f") 'deh-run-fzf
  (kbd "M-w") 'save-buffer
  (kbd "M-c") 'delete-window
  (kbd "M-o") 'delete-other-windows
  ;; (kbd "M-n") 'make-frame-command
  (kbd "M-s") 'deh-send-current-line-to-repl
  (kbd "M-t") 'deh/emamux/send-current-line
  ;; (kbd "M-d") 'deh/emamux/send-current-line
  ;; (kbd "M-t") 'deh-send-current-line-to-tmux
  ;; (kbd "M-t") 'my-send-current-line-to-tmux-pane
  ;; (kbd "M-T") '(lambda () (interactive) (emamux:unset-parameters))
  ;; (kbd "M-d") 'deh-send-current-line-to-tmux
  ;; (kbd "M-D") '(lambda () (interactive) (emamux:unset-parameters))
  (kbd "M-q") '(lambda ()
                 (interactive)
                 (kill-buffer (current-buffer)))
  (kbd "M-;") 'neotree
  ;; (kbd "M-;") 'treemacs
  (kbd "C-M-c") 'flycheck-buffer
  (kbd "C-M-p") 'flycheck-previous-error
  (kbd "C-M-n") 'flycheck-next-error
  (kbd "-") 'dired-jump
  (kbd "C-c +") 'evil-numbers/inc-at-pt
  (kbd "C-c -") 'evil-numbers/dec-at-pt)

(evil-define-key nil evil-insert-state-map
  ;; (kbd "<escape>") 'keyboard-quit
  ;; (kbd "C-g") 'evil-normal-state
  (kbd "C-=") 'er/expand-region
  (kbd "C-SPC") 'company-complete
  (kbd "C-@") 'company-complete ; the @ is the space in a terminal environment it seems?
  (kbd "M-SPC") 'company-complete
  (kbd "M-d") 'company-complete
  (kbd "M-k") 'company-complete
  (kbd "M-o") 'company-complete
  (kbd "M-w") 'company-complete
  (kbd "C-x C-o") 'company-files
  ;; (kbd "C-x C-n") 'company-dabbrev-code
  (kbd "C-x C-n") 'company-dabbrev
  (kbd "C-x C-f") 'company-files
  ;; (kbd "M-s") 'deh-send-current-line-to-repl
  (kbd "M-s") 'deh-send-current-line-to-repl
  (kbd "M-t") 'deh/emamux/send-current-line
  ;; (kbd "M-d") 'deh/emamux/send-current-line
  ;; (kbd "M-t") 'deh-send-current-line-to-tmux
  ;; (kbd "M-t") 'my-send-current-line-to-tmux-pane
  ;; (kbd "M-T") '(lambda () (interactive) (emamux:unset-parameters))
  )

(evil-define-key nil evil-visual-state-map
  (kbd "M-s") 'deh-send-region-to-repl
  ;; (kbd "M-s") 'emamux:send-region
  (kbd "M-t") 'deh-send-region-to-tmux
  ;; (kbd "M-d") 'deh-send-region-to-tmux
  ;; (kbd "M-t") 'my-send-region-to-tmux-pane
  ;; (kbd "M-T") '(lambda () (interactive) (emamux:unset-parameters))
  "$" 'evil-last-non-blank) ;; i think this is how vim behaves

(setq evil-leader/leader "SPC")

;; setup jumps (https://github.com/noctuid/evil-guide#jump)
(evil-add-command-properties #'deh-find-interface-tag :jump t)
(evil-add-command-properties #'counsel-imenu :jump t)
(evil-add-command-properties #'helm-imenu :jump t)

(setq-default evil-indent-convert-tabs nil)


                                        ; Overload shifts so that they don't lose the selection
(define-key evil-visual-state-map (kbd ">") 'deh/evil-shift-right-visual)
(define-key evil-visual-state-map (kbd "<") 'deh/evil-shift-left-visual)
(define-key evil-visual-state-map [tab] 'deh/evil-shift-right-visual)
(define-key evil-visual-state-map [S-tab] 'deh/evil-shift-left-visual)

(defun deh/evil-shift-left-visual ()
  (interactive)
  (evil-shift-left (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

(defun deh/evil-shift-right-visual ()
  (interactive)
  (evil-shift-right (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))


(add-to-list 'auto-mode-alist '("\\.mf\\'" . jar-manifest-mode))

(provide 'deh-evil)
