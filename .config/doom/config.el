(defmacro define-and-bind-text-object (key start-regex end-regex)
  (let ((inner-name (make-symbol "inner-name"))
        (outer-name (make-symbol "outer-name")))
    `(progn
       (evil-define-text-object ,inner-name (count &optional beg end type)
         (evil-select-paren ,start-regex ,end-regex beg end type count nil))
       (evil-define-text-object ,outer-name (count &optional beg end type)
         (evil-select-paren ,start-regex ,end-regex beg end type count t))
       (define-key evil-inner-text-objects-map ,key (quote ,inner-name))
       (define-key evil-outer-text-objects-map ,key (quote ,outer-name)))))

(setq user-full-name "Moritz Fröhlich"
      user-mail-address "mfroeh0@pm.me")

(setq doom-font (font-spec :family "Menlo" :size 14)
      doom-big-font (font-spec :family "Menlo" :size 20))

(setq doom-theme 'doom-gruvbox
      fancy-splash-image "~/.config/doom/misc/splash-images/emacs-e-orange.png")

(defun mfroeh/switch-window ()
  "Calls ace-select-window if there are more than 2 windows and evil-window-next otherwise"
  (interactive)
  (if (> (count-windows) 2)
    (call-interactively #'ace-select-window)
    (call-interactively #'evil-window-next)))

(map! :n "C-w C-w" #'mfroeh/switch-window
      :leader :n "w o" #'consult-buffer-other-window
      :leader :n "0" #'evil-switch-to-windows-last-buffer)

(setq evil-split-window-below t
      evil-vsplit-window-right t)

(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (consult-buffer))

(defun uuid-create ()
  "Return a newly generated UUID. This uses a simple hashing of variable data."
  (let ((s (md5 (format "%s%s%s%s%s%s%s%s%s%s"
                        (user-uid)
                        (emacs-pid)
                        (system-name)
                        (user-full-name)
                        user-mail-address
                        (current-time)
                        (emacs-uptime)
                        (garbage-collect)
                        (random)
                        (recent-keys)))))
    (format "%s-%s-3%s-%s-%s"
            (substring s 0 8)
            (substring s 8 12)
            (substring s 13 16)
            (substring s 16 20)
            (substring s 20 32))))

(defun uuid-insert ()
  "Inserts a new UUID at the point."
  (interactive)
  (insert (uuid-create)))

(setq which-key-idle-delay 0.1
      display-line-numbers-type 'relative
      doom-localleader-key ",")

;; Use command key as meta and unbind option
(setq mac-command-modifier 'meta
      mac-option-modifier nil)

;; (map! :leader :n "t v" #'visible-mode)

;; Quitting emacs
(setq confirm-kill-emacs nil
      confirm-kill-processes nil)

(map! :n "M-q" #'kill-emacs)

(setq projectile-project-search-path '("~/dev/" "~/uni/"))
(map! :leader :n "f ." (cmd! (doom-project-find-file "~/.config/")))

(use-package evil-replace-with-register
  :config
  (map! :n "gr" #'evil-replace-with-register))

(map! :leader :n "r ." #'ranger)

(setq org-directory "~/org/")
(after! org
  :map org-mode-map
  :n "M-j" #'org-metadown
  :n "M-k" #'org-metaup)

(after! org (setq org-blank-before-new-entry '(('heading . nil) ('plain-list-item . nil))))

(define-and-bind-text-object "h" "\*+ \\|+ \\|- " "$")

(use-package org-modern
  :after org
  :config
  (global-org-modern-mode)
  (setq  org-hide-emphasis-markers t
         org-pretty-entities t
         org-ellipsis "…"
         org-list-demote-modify-bullet '(("+" . "-") ("-" . "+"))
         org-modern-list '((?* . "◦") (?+ . "➤") (?- . "•"))))

;; (use-package org-superstar
;;   :config
;;   (setq org-superstar-headline-bullets-list '("◉" "☯" "○" "☯" "✸" "☯" "✿" "☯" "✜" "☯" "◆" "☯" "▶")
        ;; org-superstar-item-bullet-alist '((?* . ?•) (?+ . ?➤) (?- . ?•))
        ;; org-list-demote-modify-bullet '(("+" . "-") ("-" . "+"))
;;         org-pretty-entities t
;;         org-hide-emphasis-markers t))

(use-package org-capture
  :after org
  :config
  (map! :leader :n "o c" #'org-capture)
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/org/todos.org" "Todos")
           "** TODO %^{Todo}\n")
          ("i" "Idea" entry (file+headline "~/org/ideas.org" "Ideas")
           "** IDEA %^{Idea}\n%U\n")
          ("c" "Contact" entry (file "~/org/contacts.org")
"* %(org-contacts-template-name)
:PROPERTIES:
:ADDRESS:  %^{City}, %^{Country}
:BIRTHDAY: %^{yyyy-mm-dd}
:EMAIL:    %(org-contacts-template-email)
:PHONE:    %^{PHONE}
:NOTE:     %^{NOTE}
:END:")

          ("m" "Movie" entry (file+headline "~/org/ratings.org" "Movies")
           "** %^{TITLE}
:PROPERTIES:
:RATING: %^{n out of 10}
:END:

%U
%^{Comments}")
          ("s" "Series " entry (file+headline "~/org/ratings.org" "Series")
           "** %^{TITLE}
:PROPERTIES:
:RATING: %^{n out of 10}
:END:

%U
%^{Comments}"))))

(use-package org-journal
  :config
  (setq org-journal-date-format "%a, %Y-%m-%d"
        org-journal-date-prefix "#+title: "
        org-journal-time-prefix "\n* "
        org-journal-file-format "%Y-%m-%d.org"))

(after! org
  (setq calendar-week-start-day 1
        cfw:display-calendar-holidays nil)
  (map! :leader :n "o a c" #'cfw:open-org-calendar))

(use-package org-contacts
  :after org
  :config (setq org-contacts-files '("~/org/contacts.org")))

(defun mfroeh/kill-all-blank ()
  "Kills all blank-lines starting a current point"
  (while (and (not (eobp)) (looking-at-p "[[:blank:]]*$"))
    (kill-line)))

(defun mfroeh/org-format ()
  "Formats an org-mode file according to what I like"
  (interactive)
  (if (eq major-mode 'org-mode)
      (progn
        (setq last-end nil
              last-* nil
              last-blank nil)
        (save-excursion
          (goto-char (point-min))
          (while (not (eobp))
            (move-to-column 0)
            (if last-*
                (progn
                  (mfroeh/kill-all-blank)
                (save-excursion
                  (forward-line -2)
                  (if (and (not (looking-at-p "\*+")) (not (looking-at-p "[[:blank:]]*$")))
                      (progn (forward-line) (+evil/insert-newline-above 1))))))
            (if last-end
                (if (not (looking-at-p "[[:blank:]]*$"))
                    (+evil/insert-newline-above 1)))
            (if (and last-blank (looking-at-p "[[:blank:]]*$"))
                (mfroeh/kill-all-blank))
            (setq last-* (looking-at-p "\*+")
                  last-end (looking-at-p ":END:")
                  last-blank (looking-at-p "[[:blank:]]*$"))
            (forward-line))))
    (message "Tried to run mfroeh/org-format outside an org-mode buffer!")))

(add-hook 'org-mode-hook
           (lambda () (add-hook 'before-save-hook #'mfroeh/org-format)))

(setq lsp-lens-enable nil)

(after! lsp-clangd
  (setq lsp-clients-clangd-args
        '("-j=3"
          "--background-index"
          "--clang-tidy"
          "--completion-style=detailed"
          "--header-insertion=never"
          "--header-insertion-decorators=0"))
  (set-lsp-priority! 'clangd 2))

;; (add-hook 'c++-mode-hook 'semantic-mode)
;; (map! :n :mode '(c++-mode-map c-mode-map) :leader "r" #'srefactor-refactor-at-point)

;; (use-package! laas
;;   :hook (LaTeX-mode . 'laas-mode))

;; (setq dap-auto-configure-mode t)
;; (require 'dap-cpptools)

;; (defun my/new-cmake-lists ()
;;   (interactive "PICK DIR")
;;   (message "TODO"))
