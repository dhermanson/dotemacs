(require 'company-auctex)

(company-auctex-init)

(defun deh-latex-mode-hook ()
  "my latex mode hook"
  (set
   (make-local-variable 'company-backends)
   '( company-auctex-labels
      company-auctex-bibs
      (company-auctex-macros company-auctex-symbols company-auctex-environments))))

(add-hook 'latex-mode-hook 'deh-latex-mode-hook)

(evil-set-initial-state 'latex-mode 'normal)

(provide 'deh-auctex)

