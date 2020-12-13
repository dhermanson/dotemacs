;; (setq-default ediff-forward-word-function 'forward-char)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; (setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-split-window-function 'split-window-vertically)
(setq ediff-highlight-all-diffs t)
(setq ediff-diff-options "-w") ;; ignore whitespace

(provide 'deh-ediff)
