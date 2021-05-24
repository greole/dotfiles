;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Gregor Olenik"
      user-mail-address "go@hpsim.de")

(setq doom-font (font-spec :family "Mononoki Nerd Font" :size 20)
      doom-variable-pitch-font (font-spec :family "Ubuntu" :size 20)
      doom-big-font (font-spec :family "Mononoki Nerd Font" :size 24))
;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-palenight)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/data/notes/")
(setq org-agenda-files (list "~/data/notes/"))

(after! org (setq org-hide-emphasis-markers t))
(after! org
  (setq org-log-done t)
  (setq org-log-into-drawer t))

(use-package! org-archive
  :after org
  :config
  (setq org-archive-location "archive.org::datetree/"))



;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


(use-package! lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l" ))

(setq lsp-keymap-prefix "C-c l" )

(setq lsp-clients-clangd-args '("-j=3"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))

(setq projectile-current-project-on-switch 'keep)
;; (define-key projectile-mode-map [?\s-f] 'projectile-find-file)

;; Set cuda dir
(setenv "CPATH" (concat (getenv "CPATH") ":/opt/cuda/targets/x86_64-linux/include"))
(setenv "PATH" (concat (getenv "PATH") ":/opt/cuda/targets/x86_64-linux/include"))

;; magit
(map! :leader
            (:prefix-map ("g" . "git")
                    (:when (featurep! :tools magit)
                     :desc " magit pull" "p" #'magit-pull
                     :desc " magit push" "P" #'magit-push)))

;; Setup for writeroom
(setq +zen-text-scale 1.1 )
(add-hook 'writeroom-mode-hook (lambda () (display-line-numbers-mode -1)))


(global-subword-mode 1)           ; Iterate through CamelCase words
(setq +ivy-buffer-preview t)      ; Show a preview of a buffer
