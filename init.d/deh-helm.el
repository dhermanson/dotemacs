(require 'helm)
(require 'helm-imenu)

(setq helm-mode-fuzzy-match t)
(setq helm-etags-fuzzy-match t)
;; (setq helm-completion-style 'emacs)
(setq helm-completion-style 'helm-fuzzy)
;; (setq helm-completion-style 'helm-flex)
;; (setq helm-completion-style 'emacs)

;; these two setup helm to always open on bottom with a window above
(setq helm-split-window-default-side nil)
(setq helm-split-window-inside-p nil)
(setq helm-always-two-windows nil)
;; (setq helm-always-two-windows nil)

(defun deh-helm-imenu ()
  "Preconfigured `helm' for `imenu'."
  (interactive)
  (unless helm-source-imenu
    (setq helm-source-imenu
          (helm-make-source "Imenu" 'helm-imenu-source
            :fuzzy-match helm-imenu-fuzzy-match)))
  (let ((imenu-auto-rescan t)
        (helm-execute-action-at-once-if-one
         helm-imenu-execute-action-at-once-if-one))
    (helm :sources 'helm-source-imenu
          :buffer "*helm imenu*")))

(provide 'deh-helm)
