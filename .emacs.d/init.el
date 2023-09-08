;;; package-archives
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
	("elpa" . "https://elpa.gnu.org/packages/")))

;;; bootstrap use-package
(package-initialize)
(setq use-package-always-ensure t)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

;;; undo for evil
(use-package undo-fu
  :ensure t)

;;; evil
(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-fu)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-Y-yank-to-eol t)
  :config
  (evil-mode 1))

;;; evil-collection
(use-package evil-collection
  :after evil
  :ensure t
  :custom
  (evil-collection-setup-minibuffer t)
  :config
  (evil-collection-init))

;;; enable relative line numbers
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;;; modus themes
(use-package modus-themes
  :ensure t
  :config
  ;;; Add all your customizations prior to loading the themes
  (setq modus-themes-italic-constructs t
	modus-themes-bold-constructs nil)
  ;;; Load the theme of your choice.
  (load-theme 'modus-operandi t))

;;; snippets
(use-package yasnippet :ensure t)

;;; company for completion
(use-package company :ensure t)

;;; lsp mode
(use-package lsp-mode :ensure t
  :hook
  (c++-mode . lsp)
  (c-mode . lsp)
  (lsp-mode . lsp-enable-which-key-integration)
  :commands lsp)

;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
;;(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
;;(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(lsp-ui which-key lsp-mode company yasnippet modus-themes evil-collection evil undo-fu)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load "~/.emacs.d/prolog.el")
(add-to-list 'auto-mode-alist '("\\.pl$" . prolog-mode))
