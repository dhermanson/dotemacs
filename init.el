;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq evil-want-C-u-scroll t)
(require 'package)

(add-to-list 'load-path "~/.emacs.d/init.d/")
(add-to-list 'load-path "~/.emacs.d/vendor/")

;; add package archives
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
;; (add-to-list 'package-archives
;;              '("marmalade" . "https://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("org" . "https://orgmode.org/elpa/") t)

(package-refresh-contents)

;; (setq package-archive-priorities
;;       '(("org" . 40)
;; 	("melpa-stable" . 30)
;; 	("marmalade" . 20)
;; 	("gnu" . 15)
;; 	("melpa" . 10)))

;; packages
(setq package-list
      '(
	      ;; elfeed
	      ;; embrace
	      ace-jump-mode
        adoc-mode
        ag
	      alchemist
        ;; all-the-icons
        ;; all-the-icons-dired
	      anti-zenburn-theme
        apib-mode
        auctex
        auto-complete
        ; auto-complete-config
        avy
	      cider
	      company
        company-auctex
        ;; company-lua
	      company-lsp
	      ;; company-tern
	      company-web
	      counsel
	      counsel-etags
	      counsel-projectile
	      csharp-mode
	      csv-mode
        dap-mode
	      darktooth-theme
        deadgrep
        diff-hl
        ;; diminish
        dired-subtree
        direnv
	      dockerfile-mode
        doom-themes
        doom-modeline
	      dracula-theme
	      edit-indirect
	      editorconfig
        emamux
	      emmet-mode
        emms
	      evil
	      evil-commentary
	      evil-leader
        evil-magit
        evil-matchit
        evil-numbers
	      evil-surround
	      exec-path-from-shell
	      expand-region
	      f
        flx
        forge ;; magit forge
	      fsharp-mode
	      feature-mode
	      flycheck
	      ggtags
        git-timemachine
	      go-mode
        gotest
        graphql-mode
	      groovy-mode
	      gruvbox-theme
	      haskell-mode
	      ht
        ivy-xref
        ;; htmlize
        jar-manifest-mode
	      json-mode
        key-chord
        kotlin-mode
        lsp-mode
        ;; lsp-ui
        lsp-java
        lua-mode
	      markdown-mode
        minions
        modus-operandi-theme
	      monokai-theme
        multi-term
	      neotree
        nginx-mode
        nix-mode
        nord-theme
        omnisharp
        org-bullets
        org-plus-contrib
	      ox-gfm
        ox-reveal
	      ox-twbs
	      php-mode
	      prodigy
	      projectile
        protobuf-mode
        rainbow-mode
	      restclient
	      ripgrep
	      robe
        slime
        slime-company
	      smartparens
	      solarized-theme
        spacemacs-theme
        ;; spaceline
        ;; spaceline-all-the-icons
        syslog-mode
        systemd
	      tern
        terraform-mode
	      ;; treemacs
	      ;; treemacs-projectile
	      undo-tree
	      web-mode
	      wgrep
	      which-key
	      yasnippet
	      zenburn-theme
        color-theme-sanityinc-tomorrow
        magit
        paredit
        plantuml-mode
        ujelly-theme
        winum
        xclip
	      yaml-mode))

(package-initialize)


;; TODO: put this somewhere else
(setenv "NODE_NO_READLINE" "1")

;; fetch the list of packages available 
;; (package-refresh-contents)

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(require 'f)

;; set info directory
(setq Info-default-directory-list
      (cons "~/manuals/" Info-default-directory-list))
(setq Info-directory-list
      (cons "~/manuals/" Info-default-directory-list))

;; disable control-z
(define-key global-map (kbd "C-z") nil)

;; general settings
;; (tool-bar-mode 0)
;; (scroll-bar-mode 0)
;; (menu-bar-mode 0)
;; (global-linum-mode 0) ; display line numbers

;; (setq-default cursor-type '(bar . 2))

(setq-default tab-width 2
              c-basic-offset 2
              indent-tabs-mode nil)

;; don't allow auto splitting
(setq split-width-threshold nil
      split-height-threshold nil)


;; this must be set before lsp-mode has been loaded...lame
;; there's probably a more elegant way to achieve this (use package is one)
(setq lsp-keymap-prefix "s-;")
(setq evil-want-keybinding nil)

(require 'deh-hooks) ;; this probably needs to be first
(require 'deh-general)
(require 'deh-appearance)
(require 'deh-buffer-menu)
(require 'deh-modeline)
(require 'deh-emms)
(require 'deh-fuzzy)
(require 'deh-slime)
(require 'deh-term)
(require 'deh-diff-hl)
(require 'deh-completion)
(require 'deh-company)
(require 'deh-feature)
(require 'deh-emamux)
(require 'deh-gui)
(require 'deh-symlinks)
(require 'deh-terminal-emacs)
(require 'deh-winum)
(require 'deh-tmux)
(require 'deh-evil)
(require 'deh-git-timemachine)
(require 'deh-graphql)
(require 'deh-syslog)
(require 'deh-auctex)
(require 'deh-mpd)
(require 'deh-plantuml)
(require 'deh-neotree)
(require 'deh-adoc)
(require 'deh-comint)
(require 'deh-compilation)
(require 'deh-shell)
(require 'deh-ripgrep)
(require 'deh-lsp)
(require 'deh-grep)
(require 'deh-dired)
(require 'deh-ediff)
(require 'deh-yasnippet)
(require 'deh-minibuffer)
;; (require 'deh-treemacs)
(require 'deh-magit)
(require 'deh-dockerfile)
(require 'deh-macos)
(require 'deh-sh)
(require 'deh-yaml)
(require 'deh-xml)
;; (require 'deh-ace-jump)
(require 'deh-avy)
(require 'deh-restclient)
(require 'deh-prog)
(require 'deh-ruby)
(require 'deh-python)
(require 'deh-elisp)
(require 'deh-interpreter-mode)
(require 'deh-conf)
(require 'deh-lua)
(require 'deh-css)
(require 'deh-php)
(require 'deh-markdown)
(require 'deh-json)
(require 'deh-ivy)
(require 'deh-movement)
(require 'deh-project)
(require 'deh-kotlin)
(require 'deh-java)
(require 'deh-org)
(require 'deh-gtd)
(require 'deh-apib)
(require 'deh-fsharp)
(require 'deh-groovy)
(require 'deh-go)
(require 'deh-javascript)
(require 'deh-typescript)
(require 'deh-text)
(require 'deh-makefile)
(require 'deh-csharp)
;; (require 'deh-helm)
(require 'deh-image)
(require 'deh-web)
(require 'deh-global-maps)
(require 'deh-repl)
(require 'deh-sql)
(require 'deh-keybindings)

;; put this line somewhere else
(setq recenter-redisplay nil) ;; this helps get rid of flicker in terminal emacs when using things like helm-imenu or evil recenter


(require 'xclip)
(xclip-mode 1)

(setq-default indent-tabs-mode nil)

;; unset C-x C-c
(global-unset-key (kbd "C-x C-c"))

;; (require 'hlinum)
;; (hlinum-activate)


;; Show line numbers, dynamically with spaces on either side
(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
                     (count-lines (point-min) (point-max)))))
         (linum-format (concat " %" (number-to-string w) "d ")))
    ad-do-it))

;; always enter 'y' or 'n' instead of 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

;; inhibit the startup screen

;; backups
;; (setq backup-directory-alist `(("." . "~/.saves")))
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(setq create-lockfiles nil) ; don't create .# files
;; backup in one place. flat, no tree structure
;; (setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))

;;; Whenever an external process changes a file underneath emacs, and
;;; there was no unsaved changes in the corresponding buffer, just
;;; revert its content to reflect what's on-disk.
(global-auto-revert-mode 1)
(setq auto-revert-verbose nil)

;; (ido-mode 1)

;; ediff
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-highlight-all-diffs t)
(setq ediff-diff-options "-w") ;; ignore whitespace

;; undo-tree
(global-undo-tree-mode)

(setq flycheck-check-syntax-automatically '(save))
;; (setq flycheck-check-syntax-automatically nil)

;; don't ask whether to keep curent tags
;; this is necessary because sometimes it blocks scripts
;; from opening a new file, e.g. deh-find-file
(setq tags-add-tables nil) 

;; yasnippet
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"
	      ))
(require 'yasnippet)
(yas-global-mode 1)

;; ace-jump
;; (define-key global-map (kbd "H-c") 'ace-jump-char-mode)
;; (define-key global-map (kbd "H-;") 'ace-jump-char-mode)
;; (define-key global-map (kbd "H-w") 'ace-jump-word-mode)

;; (switch-to-buffer (create-file-buffer "test-buffer"))

;; auto-complete
;; (require 'go-autocomplete)
;; (require 'auto-complete-config)
;; (ac-config-default)

;; company
(require 'company)
(setq company-dabbrev-downcase nil)
(setq company-show-numbers 1)
(setq company-candidates-length 25)
(define-key global-map (kbd "H-SPC") 'company-complete)
(define-key global-map (kbd "C-;") 'company-complete)
(setq company-gtags-insert-arguments nil)

;; (define-key global-map (kbd "H-;") 'company-complete)
(define-key global-map (kbd "C-c c") 'company-complete)
(add-hook 'after-init-hook 'global-company-mode)

(setq-default indent-tabs-mode nil)

;; tramp
(require 'tramp)

;; helm
;; (require 'helm-config)
;; (global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
;; (global-set-key (kbd "C-x b") 'helm-buffers-list)
;; (helm-mode 1)
;; ;; helm-projectile
;; (helm-projectile-on)


;; ido
;; (ido-mode 1)
;; (setq ido-everywhere t)
;; (setq ido-enable-flex-matching t)

;; expand-region
;; (require 'expand-region)
(global-set-key (kbd "H-e") 'er/expand-region)

;; projectile-mode


;; feature more
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; minions mode
(require 'minions)
(minions-mode 1)

;; which key
(which-key-mode)

;; undo-tree
(global-undo-tree-mode-enable-in-buffers)

;; sh-mode
(setq sh-shell "bash")

(eval-after-load "sql"
  '(load-library "sql-indent"))

;; paredit
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;; lisp smartparens
;; (add-hook 'emacs-lisp-mode-hook       #'smartparens-mode)
;; (add-hook 'eval-expression-minibuffer-setup-hook #'smartparens-mode)
;; (add-hook 'ielm-mode-hook             #'smartparens-mode)
;; (add-hook 'lisp-mode-hook             #'smartparens-mode)
;; (add-hook 'lisp-interaction-mode-hook #'smartparens-mode)
;; (add-hook 'scheme-mode-hook           #'smartparens-mode)


;; haskell-mode
(require 'haskell-mode)
;; (add-hook ’haskell-mode-hook ’interactive-haskell-mode)

;; rst-mode

(defun deh/rst-mode-hook ()
  "my rst mode hook"
  (define-key rst-mode-map (kbd "H-a") 'rst-adjust)
  )
(add-hook 'rst-mode-hook 'deh/rst-mode-hook)



;; groovy
                                        ; (require 'inf-groovy)
                                        ; (setq groovy-home "/usr/local")
                                        ; (inf-groovy-keys)
                                        ; (add-to-list 'auto-mode-alist '("\.gradle$" . groovy-mode))

;; (defun deh/groovy-mode-hook ()
;;   "my groovy mode hook"
;;   (smartparens-mode)
;;   ;; (electric-indent-mode)
;;   )
;; (add-hook 'groovy-mode-hook 'deh/groovy-mode-hook)

;; jenkinsf
(add-to-list 'auto-mode-alist '("\\b\\(j\\|J\\)enkinsfile\\b" . groovy-mode))

;; go-lang
(require 'go-mode)
;; (defun deh/go-mode-hook ()
;;   "my go mode hook"
;;   (setq tab-width 2)
;;   (flycheck-mode)
;;   (set (make-local-variable 'company-backends) '(company-go))
;;   )
;; (add-hook 'go-mode-hook 'deh/go-mode-hook)
;; (add-hook 'before-save-hook 'gofmt-before-save)

;; prodigy
(require 'prodigy)
(prodigy-define-service
  :name "Jenkins"
  :command "java"
  :args (list "-jar" "jenkins.war" "--httpPort=8080")
  :cwd "~/workspace/jenkins"
  :url "http://localhost:8080")

;; wgrep
(require 'wgrep)
(setq wgrep-auto-save-buffer t)

;; web-mode
;; TODO: read about associating specific engines.
;; example:
;;   (setq web-mode-engines-alist
;;         '(("php"    . "\\.phtml\\'")
;;           ("blade"  . "\\.blade\\."))
;;   )
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; fsharp
(require 'fsharp-mode)

;; lsp
;; (require 'lsp-php)
;; (add-hook 'php-mode-hook #'lsp-php-enable)

;; start a server
;; (server-start)


(put 'scroll-left 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(defun deh/newline-indent-action (id action context)
  (when (eq action 'insert)
    (newline-and-indent)
    (previous-line)
    (indent-according-to-mode)))

(defun deh/dockblock-line-action (id action context)
  (when (eq action 'insert)
    (newline-and-indent)
    (insert "* ")))

(require 'smartparens)
(sp-with-modes '(php-mode
                 plantuml-mode
                 graphql-mode
                 go-mode
		             json-mode
		             fsharp-mode
		             js-mode
                 web-mode
                 css-mode
                 groovy-mode
		             typescript-mode)
  (sp-local-pair "{" "}"
		             :when '(("RET"))
		             :post-handlers '(:add deh/newline-indent-action)
		             :actions '(insert)))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; (server-start)

(savehist-mode)

;; (spaceline-emacs-theme)
;; (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)

(setq initial-scratch-message "")

;; (defun deh/start-emacs-server-if-env-var-set ()
;;   "Start a server if an environment variable is set."
;;   (interactive)
;;   (let (($serverName (getenv "DEH_EMACS_SERVER_NAME")))
;;     (if $serverName
;;         (progn
;;           (setq server-name $serverName)
;;           (server-start))
;;       (print "no server name var set"))))

;; (deh/start-emacs-server-if-env-var-set)

;; SHAME
(require 'ivy-xref)
;; xref initialization is different in Emacs 27 - there are two different
;; variables which can be set rather than just one
(when (>= emacs-major-version 27)
  (setq xref-show-definitions-function #'ivy-xref-show-defs))
;; Necessary in Emacs <27. In Emacs 27 it will affect all xref-based
;; commands other than xref-find-definitions (e.g. project-find-regexp)
;; as well
(setq xref-show-xrefs-function #'ivy-xref-show-xrefs)

(provide 'init)
;;; init.el ends here
