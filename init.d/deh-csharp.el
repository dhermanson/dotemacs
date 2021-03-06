(require 'omnisharp)
(require 'company)
(require 'flycheck)
(require 'eldoc)
(require 'smartparens)
(require 'counsel)
(require 'editorconfig)
(require 'evil)
(require 'f)
(require 'yasnippet)
(require 'xml)

(evil-set-initial-state 'csharp-mode 'normal)

(add-to-list 'auto-mode-alist '("\\.csproj\\'" . xml-mode))

(setq omnisharp-imenu-support t)

(defun deh-csharp-hook ()
  "my csharp hook"
  (omnisharp-mode)
  (company-mode)
  (flycheck-mode)
  (eldoc-mode)
  (smartparens-mode)
  (editorconfig-mode t)
  ;; (set (make-local-variable 'company-backends) '((company-yasnippet)))
  (set (make-local-variable 'company-backends) '((company-omnisharp company-yasnippet)))
  (setq eldoc-documentation-function #'omnisharp-eldoc-function)

  (c-set-style "bsd")
  (setq c-syntactic-indentation t)
  (setq c-basic-offset 4)
  (setq truncate-lines t)
  (setq tab-width 4)
  (setq evil-shift-width 4)
  (setq indent-tabs-mode nil)

  (evil-leader-mode t)
  (evil-surround-mode t)
  
  )

(add-hook 'csharp-mode-hook 'deh-csharp-hook)

; (evil-leader/set-key-for-mode 'csharp-mode
;   ;; "k" 'counsel-etags-grep
;   )


;; (defun deh-csharp-run-aspnet (f)
;;   (interactive "f")
;;   (let ((default-directory (projectile-project-root)))
;;     (compile (concat "dotnet run --project " f) nil)))

;; jumps
(evil-add-command-properties 'omnisharp-go-to-definition :jump: t)

;; TODO: figure out how to put this on a specific projectile type
(defun deh-csharp-create-migration (directory name)
  "create a fluent-migrator migration file"
  (interactive "DMigrations directory: \nsMigration name: ")
  (let* ((time (format-time-string "%Y%m%d%H%M%S"))
	 (filename (concat time "_" name ".cs")))
    (find-file (f-join directory filename))
    (insert (s-lex-format "using FluentMigrator;

namespace fix
{
	[Migration(${time})]
	public class ${name} : Migration
	{
		public override void Up()
		{
		
		}

		public override void Down()
		{
		
		}
	}
}"))))


(provide 'deh-csharp)
