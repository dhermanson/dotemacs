;; org
(require 'org)
(require 'org-protocol)
(require 'org-capture)
(require 'ob-ruby)
;; (require 'ob-sh)
(require 'ob-haskell)
(require 'ob-plantuml)
(require 'ox-latex)
(require 'ox-twbs)
(require 'ox-gfm)
(require 'ox-html)
(require 'ox-reveal)
(require 'ox-confluence)
(require 'evil)
(require 'org-bullets)

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(evil-set-initial-state 'org-mode 'emacs)

(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; other Babel languages
   (plantuml . t)
   (emacs-lisp . t)
   (ruby . t)
   (python . t)
   (shell . t)
   (js . t)
   (sql . t)
   (dot . t)
   (haskell . t)))

(setq org-confirm-babel-evaluate nil)

(setq org-startup-indented t)
(setq org-src-fontify-natively t)
(setq org-startup-folded t)

;; https://github.com/syl20bnr/spacemacs/issues/11801
;; org-agenda
;; (setq org-agenda-files '("~/org/gtd/inbox.org"
;;                           "~/org/gtd/gtd.org"
;;                           "~/org/gtd/tickler.org"))


;; org-capture
(setq org-directory "~/Dropbox/org")
(setq org-default-notes-file (concat org-directory "/capture.org"))

;; org refile
(setq org-refile-targets '((nil :maxlevel . 9)
                           (org-agenda-files :maxlevel . 2)))
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-use-outline-path t)

;; org-plantuml
(setq org-plantuml-jar-path plantuml-jar-path)

;; org-latex
(setq org-latex-listings 'minted)
(setq org-latex-packages-alist '(("" "minted")))
(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))


(defun deh-org-add-file-to-org-agenda-files (file)
  "Set a file as the agenda file."
  (interactive "f")
  (setq org-agenda-files (list file)))

(defun deh-org-add-current-file-to-org-agenda-files ()
  "Set current file a file as the agenda file."
  (interactive)
  (deh-org-add-file-to-org-agenda-files (buffer-file-name)))

(defun deh-org-mode-hook ()
  "My org mode hook."
  (visual-line-mode t)
  ;; (setq truncate-lines nil)
  (company-mode t)
  (set (make-local-variable 'company-backends)
       '((company-files company-yasnippet company-dabbrev company-ispell)))

  (setq org-html-htmlize-output-type 'css)
  (setq org-html-htmlize-font-prefix "org-")
  (setq display-line-numbers nil)
  )

(defun deh-org-screenshot (&optional file)
  (interactive
   (let ((filename (read-file-name "Enter file: ")))
     (list filename)))
  (let ((current-buffer (current-buffer))
        (relative-path (f-relative file)))
    (progn
      (deh-screenshot file)
      (with-current-buffer current-buffer
        (insert "[[./" relative-path "]]")))))

(defadvice org-capture
    (after make-full-window-frame activate)
  "Advise capture to be the only window when used as a popup"
  (if (equal "emacs-capture" (frame-parameter nil 'name))
      (delete-other-windows)))

(defadvice org-capture-finalize
    (after delete-capture-frame activate)
  "Advise capture-finalize to close the frame"
  (if (equal "emacs-capture" (frame-parameter nil 'name))
      (delete-frame)))

;; (define-key org-mode-map (kbd "H-s") 'deh-org-screenshot)

(add-hook 'org-mode-hook #'deh-org-mode-hook)

;; (define-key org-mode-map (kbd "C-c a f") 'deh-org-add-current-file-to-org-agenda-files)

(setq org-structure-template-alist 
      '(("a" . "export ascii")
        ("c" . "center")
        ("C" . "comment")
        ("e" . "example")
        ("E" . "export")
        ("h" . "export html")
        ("l" . "export latex")
        ("q" . "quote")
        ("s" . "src")
        ("v" . "verse")))

(require 'org-tempo)


(defun deh/org/fix-inline-images ()
  (when org-inline-image-overlays
    (org-redisplay-inline-images)))

(with-eval-after-load 'org
  (add-hook 'org-babel-after-execute-hook 'deh/org/fix-inline-images))

(defun deh/org/confluence-link (link desc info)
  (let ((raw-link (org-element-property :raw-link link)))
    (when (org-string-nw-p desc) (format "%s|" desc))
    (cond
     ((or (s-ends-with? ".jpg" raw-link)
          (s-ends-with? ".jpeg" raw-link)
          (s-ends-with? ".png" raw-link)
          (s-ends-with? ".svg" raw-link))
      (concat "!"
              (replace-regexp-in-string "^file:" "" raw-link)
              "!"))
     ((string-match "^confluence:" raw-link)
      (concat "["
              (replace-regexp-in-string "^confluence:" "" raw-link)
              "]"))
     (t
      (concat "[" raw-link "]")))
))

(org-export-define-derived-backend 'deh/confluence 'confluence
  :translate-alist '((bold . org-confluence-bold)
		     (code . org-confluence-code)
		     (example-block . org-confluence-example-block)
		     (fixed-width . org-confluence-fixed-width)
		     (footnote-definition . org-confluence-empty)
		     (footnote-reference . org-confluence-empty)
		     (headline . org-confluence-headline)
		     (italic . org-confluence-italic)
		     (item . org-confluence-item)
		     (link . deh/org/confluence-link)
		     (paragraph . org-confluence-paragraph)
		     (property-drawer . org-confluence-property-drawer)
		     (quote-block . org-confluence-quote-block)
		     (section . org-confluence-section)
		     (src-block . org-confluence-src-block)
		     (strike-through . org-confluence-strike-through)
		     (table . org-confluence-table)
		     (table-cell . org-confluence-table-cell)
		     (table-row . org-confluence-table-row)
		     (template . org-confluence-template)
		     (timestamp . org-confluence-timestamp)
		     (underline . org-confluence-underline)
		     (verbatim . org-confluence-verbatim)))

(defun deh/org/confluence-export-as-confluence
  (&optional async subtreep visible-only body-only ext-plist)
  "Export current buffer to a text buffer.

If narrowing is active in the current buffer, only export its
narrowed part.

If a region is active, export that region.

A non-nil optional argument ASYNC means the process should happen
asynchronously.  The resulting buffer should be accessible
through the `org-export-stack' interface.

When optional argument SUBTREEP is non-nil, export the sub-tree
at point, extracting information from the headline properties
first.

When optional argument VISIBLE-ONLY is non-nil, don't export
contents of hidden elements.

When optional argument BODY-ONLY is non-nil, strip title, table
of contents and footnote definitions from output.

EXT-PLIST, when provided, is a property list with external
parameters overriding Org default settings, but still inferior to
file-local settings.

Export is done in a buffer named \"*Org CONFLUENCE Export*\", which
will be displayed when `org-export-show-temporary-export-buffer'
is non-nil."
  (interactive)
  (org-export-to-buffer 'deh/confluence "*org CONFLUENCE Export*"
    async subtreep visible-only body-only ext-plist (lambda () (text-mode))))

(fset 'add-front-end-requirement-categories
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([5 M-return M-right 85 88 M-return 66 117 115 105 110 101 115 115 32 76 111 103 105 99 M-return 65 80 73] 0 "%d")) arg)))

(evil-define-key nil org-mode-map (kbd "<s-return>") 'org-meta-return)


(provide 'deh-org)
