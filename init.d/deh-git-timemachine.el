(require 'git-timemachine)
(require 'evil)

;; (evil-make-overriding-map git-timemachine-mode-map 'normal)

;; (define-key git-timemachine-mode-map (kbd "e") '(lambda ()
;;                                                   (interactive)
;;                                                   (git-timemachine-show-commit)
;;                                                   (magit-ediff-dwim)))

(defadvice git-timemachine-mode (after git-timemachine-change-to-emacs-state activate compile)
  "when entering git-timemachine mode, change evil normal state to emacs state"

  (if (evil-normal-state-p)

      (evil-emacs-state)

    (evil-normal-state)))

(ad-activate 'git-timemachine-mode)

;; http://blog.binchen.org/posts/use-git-timemachine-with-evil.html

(provide 'deh-git-timemachine)
