(require 'company)
(require 'flycheck)
(require 'smartparens)
(require 'evil)
(require 'yasnippet)

(evil-set-initial-state 'plantuml-mode 'normal)

(defun deh-plantuml-hook ()
  "my plantuml hook"
  (company-mode)
  (flycheck-mode)

  (setq display-line-numbers 'relative)
  (smartparens-mode)
  (set (make-local-variable 'company-backends) '((company-dabbrev-code company-yasnippet)))
  ;; (setq evil-shift-width 2)
  )

;; (setq plantuml-jar-path "~/.config/deh/jars/plantuml.jar")
(setq-default plantuml-output-type "png")
(setq-default plantuml-indent-level 4)
(setq-default plantuml-exec-mode 'jar)
(add-hook 'plantuml-mode-hook 'deh-plantuml-hook)

(add-to-list 'auto-mode-alist '("\\.puml$" . plantuml-mode))
(add-to-list 'auto-mode-alist '("\\.plantuml$" . plantuml-mode))

(with-eval-after-load 'flycheck
  (require 'flycheck-plantuml)
  (flycheck-plantuml-setup))


(provide 'deh-plantuml)
