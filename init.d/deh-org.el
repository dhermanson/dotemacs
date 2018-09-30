;; org
(require 'org)
(require 'org-bullets)
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
(require 'evil)

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

(setq org-startup-indented t)
(setq org-src-fontify-natively t)

;; org-capture
(setq org-directory "~/Dropbox/org")
(setq org-default-notes-file (concat org-directory "/capture.org"))

;; org-plantuml
(setq plantuml-jar-path "~/bin/plantuml.jar")
(setq org-plantuml-jar-path "~/bin/plantuml.jar")

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
  (org-bullets-mode t)
  (visual-line-mode t)
  (company-mode t)
  (setq company-backends '(company-files company-yasnippet))

  (setq org-html-htmlize-output-type 'css)
  (setq org-html-htmlize-font-prefix "org-")
  ;; (setq display-line-numbers 'relative)
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

(define-key org-mode-map (kbd "H-s") 'deh-org-screenshot)

(add-hook 'org-mode-hook #'deh-org-mode-hook)

(define-key org-mode-map (kbd "C-c a f") 'deh-org-add-current-file-to-org-agenda-files)


(provide 'deh-org)
