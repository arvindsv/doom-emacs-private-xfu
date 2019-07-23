;; * Modules
(defvar IS-TERMUX
  (not (equal user-login-name "xfu"))
  "Is the emacs launched from Termux?")

(if IS-TERMUX
    (doom! :completion
           (company +auto)
           ivy

           :ui
           (popup +all +defaults)
           doom
           doom-dashboard
           hl-todo
           modeline
           treemacs
           window-select
           workspaces

           :editor
           (evil +commands +everywhere)
           file-templates
           fold
           format
           lispy
           multiple-cursors
           rotate-text
           snippets

           :emacs
           dired
           electric
           vc

           :tools
           ;;       reference
           (lookup +docsets)
           ;; password-store
           editorconfig
           eval
           flycheck
           flyspell
           magit
           ;;       gist

           :lang
           ;;       lsp
           ;;       data
           ;;       (python +conda)
           ess
           ;;       (latex
           ;;        +latexmk
           ;;        +zathura)
           (org
            +attach
            +babel
            +capture
            +present)
           ;; (org-private
           ;;  +todo
           ;;  +babel
           ;;  +capture
           ;;  +latex
           ;;  +export
           ;;  +style)
           emacs-lisp
           ;;       javascript
           markdown
           sh
           ;;       web

           :config
           (default +snippets +bindings +commands))
  (doom! :completion
         (company +auto +childframe)
         (ivy +childframe)

         :ui
         nav-flash
         vc-gutter
         (popup +all +defaults)
         doom
         doom-dashboard
         hl-todo
         modeline
         ophints
         treemacs
         window-select
         workspaces

         :editor
         (evil +commands +everywhere)
         file-templates
         fold
         format
         lispy
         multiple-cursors
         rotate-text
         snippets

         :emacs
         dired
         electric
         vc

         :term
         vterm

         :tools
         ;;       reference
         ;;      ein
         (lookup +docsets)
         ;; password-store
         editorconfig
         eval
         flycheck
         flyspell
         magit
         ;;       gist

         :lang
         ;;       lsp
         ;;       data
         ;;       (python +conda)
         ess
         ;;       (latex
         ;;        +latexmk
         ;;        +zathura)
         (org
          +attach
          +babel
          +capture
          +present)
         ;; (org-private
         ;;  +todo
         ;;  +babel
         ;;  +ipython +right-popup
         ;;  +capture
         ;;  +latex
         ;;  +export
         ;;  +style)
         emacs-lisp
         ;;       javascript
         markdown
         sh
         ;;       web

         :email
         notmuch

         :app
         ;;       sx
         ;;       rss
         ;;(write
         ;; +wordnut
         ;; +synosaurus)

         :config
         (default +snippets +bindings +commands)))

;; * UI
(setq browse-url-browser-function 'browse-url-default-browser
      display-line-numbers-type nil
      doom-big-font (font-spec :family "SF Mono" :size 18)
      doom-font (font-spec :family "SF mono" :size 14)
      doom-theme 'doom-nord
      doom-unicode-font (font-spec :family "Sarasa Mono SC" :size 14)
      doom-variable-pitch-font (font-spec :family "SF Compact Display" :size 14)
      frame-alpha-lower-limit 0
      frame-title-format
      '("emacs%@"
        (:eval (system-name)) ": "
        (:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name)) "%b")))
      indicate-buffer-boundaries nil
      indicate-empty-lines nil
      org-bullets-bullet-list '("◉")
      pdf-view-use-unicode-ligther nil
      which-key-idle-delay 0.3)

(when (display-graphic-p)
  (or standard-display-table
      (setq standard-display-table (make-display-table)))
  (set-display-table-slot standard-display-table 0 ?\ )
  (setq-default fringe-indicator-alist
                (delq (assq 'truncation fringe-indicator-alist)
                      (delq (assq 'continuation fringe-indicator-alist)
                            fringe-indicator-alist))))


;; * Config
(setq +file-templates-dir "~/.doom.d/templates"
      max-specpdl-size 10000
      user-full-name "Alexander Fu Xi"
      user-mail-address "fuxialexander@gmail.com")

;; * Keys
(setq +default-repeat-backward-key "'"
      +default-repeat-forward-key ";"
      +evil-collection-disabled-list '(elfeed notmuch kotlin-mode simple dired helm ivy anaconda-mode outline)
      +magit-hub-features t
      doom-localleader-key ","
      evil-collection-company-use-tng nil
      evil-respect-visual-line-mode t
      evil-shift-width 2
      evil-snipe-override-evil-repeat-keys nil
      evil-want-C-u-scroll t
      evil-want-integration t)

;; * Repo
(setq package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu/")
                         ("org" . "http://elpa.emacs-china.org/org/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))

;; * Termux-specific
(when IS-TERMUX
  (setq browse-url-browser-function 'browse-url-xdg-open))
;; * Mac-specific
(when IS-MAC
  (setq insert-directory-program "/usr/local/bin/gls")
  (setq ns-use-thin-smoothing t)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark)))
;; * Arch-specific
(when IS-LINUX
  (setq insert-directory-program "ls"
        conda-anaconda-home "/opt/miniconda3"
        +python-conda-home "/home/xfu/.conda"
        +modeline-height 48
        doom-big-font (font-spec :family "SF Mono" :size 24)
        doom-font (font-spec :family "SF mono" :size 24)
        doom-theme 'doom-nord
        doom-unicode-font (font-spec :family "Sarasa Mono SC" :size 24)
        doom-variable-pitch-font (font-spec :family "SF Compact Display" :size 26)))
