(require 'diff-hl)
(require 'magit)


(global-diff-hl-mode)
;; (diff-hl-margin-mode)
(fringe-mode '(16 . nil))
;; https://emacsredux.com/blog/2015/01/18/customizing-the-fringes/
;; (diff-hl-flydiff-mode)

(add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

(provide 'deh-diff-hl)
