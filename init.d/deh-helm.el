(require 'helm)
(require 'helm-imenu)

(setq helm-mode-fuzzy-match nil)
(setq helm-etags-fuzzy-match nil)

;; these two setup helm to always open on bottom with a window above
(setq helm-split-window-inside-p nil)
(setq helm-always-two-windows t)

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
