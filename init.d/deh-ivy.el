(require 'ivy)
(require 'flx)

;; pro tip, i've learned that i can hit S-SPC when in counsel completion mode
;; to restrict the query to the found results

(setq ivy-height 20)

(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")

;; https://oremacs.com/2016/01/06/ivy-flx/
(setq ivy-re-builders-alist
      '((t . ivy--regex-fuzzy)))

(setq ivy-initial-inputs-alist nil)

;; (defun counsel-etags-grep-cli (keyword use-cache)
;;   "Use KEYWORD and USE-CACHE to build CLI.
;; Extended regex is used, like (pattern1|pattern2)."
;;   (cond
;;    ((counsel-etags-has-quick-grep)
;;     (format "%s %s \"%s\" --"
;;             (concat (executable-find "rg")
;;                     ;; (if counsel-etags-debug " --debug")
;;                     " -n -M 512 --no-heading --color never -s --path-separator /")
;;             (counsel-etags-exclude-opts use-cache)
;;             keyword))
;;    (t
;;     ;; use extended regex always
;;     (format "%s -rsnE %s \"%s\" *"
;;             (or counsel-etags-grep-program (counsel-etags-guess-program "grep"))
;;             (counsel-etags-exclude-opts use-cache)
;;             keyword))))

(define-key counsel-find-file-map (kbd "C-l") 'counsel-up-directory)

(provide 'deh-ivy)
