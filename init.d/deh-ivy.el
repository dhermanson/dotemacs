(require 'ivy)
(require 'flx)

(ivy-mode 1)

;; look at ivy-help command

;; pro tip, i've learned that i can hit S-SPC when in counsel completion mode
;; to restrict the query to the found results

(setq ivy-height 10)

(setq ivy-use-virtual-buffers nil)
(setq ivy-count-format "(%d/%d) ")

;; https://oremacs.com/swiper/#key-bindings

;; https://oremacs.com/2016/01/06/ivy-flx/
;; (setq ivy-re-builders-alist
;;       '((counsel-rg . ivy--regex-plus)
;;         (t . ivy--regex-fuzzy)))
(setq ivy-re-builders-alist
      '((t . ivy--regex-plus)
        ))

;; https://github.com/abo-abo/swiper/issues/2204
;; https://github.com/abo-abo/swiper/issues/1542#issuecomment-440659663
;; without this it seems to use case insensitive searches
;; but then when i press C-C C-o for the occur buffer, the non
;; case-insensitive matches don't come through
(setq ivy-case-fold-search-default 'auto)

;; (setq ivy-case-fold-search-default nil)
;; (setq counsel-rg-base-command "rg --with-filename --no-heading --line-number --color never  %s")


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

;; (define-key counsel-find-file-map (kbd "C-l") 'counsel-up-directory)


;; counsel
(counsel-projectile-mode)

(provide 'deh-ivy)
