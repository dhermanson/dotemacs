;; (with-eval-after-load 'company
;;   (evil-define-key nil company-active-map
;;     (kbd "C-n") 'company-select-next
;;     (kbd "C-p") 'company-select-previous
;;     (kbd "C-m") 'company-complete
;;     (kbd "C-i") 'company-complete
;;     (kbd "C-;") 'company-complete
;;     (kbd "C-h") 'delete-backward-char
;;     (kbd "C-l") 'company-show-doc-buffer

;;     (kbd "s-n") 'company-select-next
;;     (kbd "s-p") 'company-select-previous
;;     (kbd "s-j") 'company-select-next
;;     (kbd "s-k") 'company-select-previous
;;     (kbd "s-m") 'company-complete
;;     (kbd "s-i") 'company-complete
;;     (kbd "s-;") 'company-complete
;;     (kbd "C-h") 'delete-backward-char
;;     (kbd "s-l") 'company-show-doc-buffer
;;     (kbd "s-s") 'company-search-candidates
;;     (kbd "s-g") 'company-abort
;;     )

;;   (evil-define-key nil company-search-map
;;     (kbd "C-h") 'delete-backward-char
;;     (kbd "C-t") 'company-search-toggle-filtering
;;     (kbd "C-n") 'company-search-repeat-forward
;;     (kbd "C-p") 'company-search-repeat-backward

;;     (kbd "s-t") 'company-search-toggle-filtering
;;     (kbd "s-n") 'company-search-repeat-forward
;;     (kbd "s-p") 'company-search-repeat-backward
;;     (kbd "s-g") 'company-search-abort
;;     )
;;   )

(provide 'deh-company)
