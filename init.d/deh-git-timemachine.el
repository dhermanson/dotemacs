(require 'git-timemachine)
(require 'evil)

;; @see http://blog.binchen.org/posts/use-git-timemachine-with-evil.html
(with-eval-after-load 'git-timemachine
  (evil-make-overriding-map git-timemachine-mode-map 'normal)
  ;; force update evil keymaps after git-timemachine-mode loaded
  (add-hook 'git-timemachine-mode-hook #'evil-normalize-keymaps))


(provide 'deh-git-timemachine)
