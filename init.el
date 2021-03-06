;;; init.el -*- lexical-binding: t; -*-
;; Time-stamp: <2020-07-30 10:22:31 csraghunandan>

;; Copyright (C) 2016-2020 Chakravarthy Raghunandan
;; Author: Chakravarthy Raghunandan <rnraghunandan@gmail.com>

;; Every file opened and loaded by Emacs will run through this list to check for
;; a proper handler for the file, but during startup, it won’t need any of them.
(defvar rag--file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

;; load directory for configuration files for emacs
(add-to-list 'load-path (concat user-emacs-directory "setup-files/"))

;; set home and emacs directories
(defvar user-home-directory (concat (getenv "HOME") "/"))
(setq user-emacs-directory (concat user-home-directory ".emacs.d/"))

(load (locate-user-emacs-file "general.el") nil :nomessage)



;; load all use-package related configuration
(load (locate-user-emacs-file "setup-packages.el") nil :nomessage)

(require 'setup-optimizations)
(require 'setup-no-littering)
(require 'setup-company)
(require 'setup-osx)
(require 'setup-backup)
(require 'setup-selected)
(require 'setup-treemacs)
(require 'setup-search)
(require 'setup-rg)
(require 'setup-ibuffer)
(require 'setup-recentf)
(require 'setup-desktop)
(require 'setup-calc)
(require 'setup-ediff)
(require 'setup-dired)
(require 'setup-elisp-mode)
(require 'setup-flycheck)
(require 'setup-spell)
(require 'setup-bookmark)
(require 'setup-hydra)
(require 'setup-org)
(require 'setup-smartparens)
(require 'setup-git)
(require 'setup-avy)
(require 'setup-window)
(require 'setup-project)
(require 'setup-yas)
(require 'setup-buffers)
(require 'setup-ivy)
(require 'setup-counsel)
(require 'setup-movement)
(require 'setup-markdown)
(require 'setup-plantuml)
(require 'setup-info)
(require 'setup-mode-line)
(require 'setup-editing)
(require 'setup-racket)
(require 'setup-rust)
(require 'setup-go)
(require 'setup-lsp)
(require 'setup-cc)
(require 'setup-haskell)
(require 'setup-python)
(require 'setup-tex)
(require 'setup-origami)
(require 'setup-white-space)
(require 'setup-mc)
(require 'setup-js)
(require 'setup-json)
(require 'setup-typescript)
(require 'setup-ocaml)
(require 'setup-web-mode)
(require 'setup-css)
(require 'setup-eshell)
(require 'setup-comint)
(require 'setup-vterm)
(require 'setup-which-key)
(require 'setup-kurecolor)
(require 'setup-font-check)
(require 'setup-misc)
(require 'setup-visual)
(require 'setup-tree-sitter)
(require 'setup-tramp)
(require 'setup-theme)
(require 'setup-highlight)
(require 'setup-calendar)
(require 'setup-minibuffer)
(require 'setup-purescript)
(require 'setup-lua)
(require 'setup-abbrev)
(require 'setup-compile)
(require 'setup-macro)
(require 'setup-help)
(require 'setup-ansible)
(require 'setup-sh)
(require 'setup-comb)
(require 'setup-smerge)
(require 'setup-nov)
(require 'setup-xkcd)
(require 'setup-docker)
(require 'setup-pdf)
(require 'setup-engine-mode)
(require 'setup-config-files)



;; start emacs server only it has not already been started
(require 'server)
(unless (server-running-p) (server-start))

;; set gc-cons-threshold back to original value
(setq file-name-handler-alist rag--file-name-handler-alist
      gc-cons-threshold 16777216 ;; use 16MB
      gc-cons-percentage 0.1)
;; enable gchm mode
(gcmh-mode +1)
;; garbage collect when moving out to other applications
(add-function :after after-focus-change-function #'gcmh-idle-garbage-collect)

;;; init.el ends here
