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


(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-i") 'company-complete)
  (define-key company-active-map (kbd "C-;") 'company-complete)
  (define-key company-active-map (kbd "C-m") 'company-complete)
  (define-key company-active-map (kbd "C-n") 'company-select-next-or-abort)
  (define-key company-active-map (kbd "C-j") 'company-select-next-or-abort)
  (define-key company-active-map (kbd "C-k") 'company-select-previous-or-abort)
  (define-key company-active-map (kbd "C-p") 'company-select-previous-or-abort)
  (define-key company-active-map (kbd "C-u") 'company-previous-page)
  (define-key company-active-map (kbd "C-d") 'company-next-page)
  ;; (define-key company-active-map (kbd "C-d") 'company-show-doc-buffer)
  ;; (define-key company-active-map (kbd "C-,") 'company-show-doc-buffer)
  ;; (define-key company-active-map (kbd "M-d") 'company-show-doc-buffer)
  (define-key company-active-map (kbd "C-h") 'delete-backward-char)
  ;; (define-key company-active-map (kbd "M-l") 'company-show-location)

  ;; (evil-define-key nil company-active-map (kbd "C-[") 'company-abort)
  ;; (evil-define-key nil company-active-map (kbd "C-i") 'company-complete)
  ;; (evil-define-key nil company-active-map (kbd "C-;") 'company-complete)
  ;; (evil-define-key nil company-active-map (kbd "C-m") 'company-complete)
  ;; (evil-define-key nil company-active-map (kbd "C-n") 'company-select-next-or-abort)
  ;; (evil-define-key nil company-active-map (kbd "C-j") 'company-select-next-or-abort)
  ;; (evil-define-key nil company-active-map (kbd "C-k") 'company-select-previous-or-abort)
  ;; (evil-define-key nil company-active-map (kbd "C-p") 'company-select-previous-or-abort)
  ;; (evil-define-key nil company-active-map (kbd "C-d") 'company-next-page)
  ;; (evil-define-key nil company-active-map (kbd "C-u") 'company-previous-page)
  ;; ;; (evil-define-key nil company-active-map (kbd "C-d") 'company-show-doc-buffer)
  ;; (evil-define-key nil company-active-map (kbd "C-,") 'company-show-doc-buffer)
  ;; (evil-define-key nil company-active-map (kbd "C-h") 'delete-backward-char)
  ;; (evil-define-key nil company-active-map (kbd "C-l") 'company-show-location)
)
  ;; (define-key company-active-map (kbd "s-i") 'company-complete)
  ;; (define-key company-active-map (kbd "s-;") 'company-complete)
  ;; (define-key company-active-map (kbd "s-m") 'company-complete)
  ;; (define-key company-active-map (kbd "s-n") 'company-select-next)
  ;; (define-key company-active-map (kbd "s-j") 'company-select-next)
  ;; (define-key company-active-map (kbd "s-k") 'company-select-previous)
  ;; (define-key company-active-map (kbd "s-p") 'company-select-previous)
  ;; (define-key company-active-map (kbd "s-d") 'company-next-page)
  ;; (define-key company-active-map (kbd "s-u") 'company-previous-page)
  ;; (define-key company-active-map (kbd "s-,") 'company-show-doc-buffer)
  ;; (define-key company-active-map (kbd "s-h") 'delete-backward-char)
  ;; (define-key company-active-map (kbd "s-l") 'company-show-location))


(provide 'deh-company)
