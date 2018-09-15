;; https://www.emacswiki.org/emacs/LocalVariables#toc2
;; Provide a new MAJORMODE-local-vars-hook
 (add-hook 'hack-local-variables-hook 'run-local-vars-mode-hook)
 (defun run-local-vars-mode-hook ()
   "Run a hook for the major-mode after the local variables have been processed."
   (run-hooks (intern (concat (symbol-name major-mode) "-local-vars-hook"))))


(provide 'deh-hooks)
