;; packages
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

;; install packages
(package-install 'ace-jump-mode)
(package-install 'evil)
(package-install 'paredit)

;; require packages
(require 'ace-jump-mode)
(require 'paredit)
(require 'undo-tree)

;; appearance
(load-theme 'wombat t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq display-line-numbers 'relative)

;; undo-tree
(global-undo-tree-mode)

;; evil
(setq evil-want-C-d-scroll t)
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)

;; evil keybindings
(defvar deh-evil-leader-map (make-sparse-keymap) "keymap for 'leader key' shortcuts")
(defvar deh-evil-window-map (make-sparse-keymap) "keymap for 'window' shortcuts")

(evil-define-key 'normal global-map
  (kbd "SPC") deh-evil-leader-map
  (kbd "M-w") 'save-buffer)

(evil-define-key nil deh-evil-leader-map
  (kbd ";") 'ace-jump-char-mode
  (kbd "b") 'switch-to-buffer
  (kbd "w") deh-evil-window-map)

(evil-define-key nil deh-evil-window-map
  (kbd "s") 'evil-window-split
  (kbd "v") 'evil-window-vsplit
  (kbd "o") 'delete-other-windows)


