;;; setup-treemacs.el -*- lexical-binding: t; -*-
;; Time-stamp: <2020-02-20 14:56:27 csraghunandan>

;; Copyright (C) 2016-2020 Chakravarthy Raghunandan
;; Author: Chakravarthy Raghunandan <rnraghunandan@gmail.com>

;; treemacs: a tree layout file explorer for Emacs
;; https://github.com/Alexander-Miller/treemacs
(use-package treemacs
  :hook
  ;; slightly lower the size of treemacs window
  ((treemacs-mode . (lambda ()
                      (setq buffer-face-mode-face '(:height .88))
                      (buffer-face-mode))))
  :config
  (progn
    (setq treemacs-follow-after-init t
          treemacs-recenter-after-file-follow t
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-eldoc-display nil
          treemacs-collapse-dirs (if (executable-find "python") 3 0)
          treemacs-silent-refresh t
          treemacs-silent-filewatch t
          treemacs-change-root-without-asking t
          treemacs-sorting 'alphabetic-asc
          treemacs-show-hidden-files t
          treemacs-never-persist nil
          treemacs-is-never-other-window t)

    ;; set the correct python3 executable path. This is needed for
    ;; treemacs-git-mode extended
    (setq treemacs-python-executable (executable-find "python"))

    (defun doom-themes-hide-modeline ()
      (setq mode-line-format nil))

    (defun doom-themes-hide-fringes ()
      "Remove fringes in currnent window."
      (when (display-graphic-p)
        (set-window-fringes nil 0 0)))

    ;; Disable fringes (and reset them everytime treemacs is selected because it
    ;; may change due to outside factors)
    (add-hook 'treemacs-mode-hook #'doom-themes-hide-fringes)
    (advice-add #'treemacs-select-window :after #'doom-themes-hide-fringes)

    ;; The modeline isn't useful in treemacs
    (add-hook 'treemacs-mode-hook #'doom-themes-hide-modeline)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-resize-icons 16)

    ;; no longer needed since fringe is hidden in doom-themes-treemacs-theme
    (treemacs-fringe-indicator-mode nil)

    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))

  :bind
  (:map global-map
        ("C-c f" . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)))

(use-package treemacs-projectile
  :after treemacs projectile
  :bind (:map global-map
              ("C-c o t" . treemacs-projectile)))

(use-package treemacs-icons-dired
  :after treemacs dired
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit)

;; Integration between lsp-mode and treemacs and implementation of treeview
;; controls using treemacs as a tree renderer.
;; https://github.com/emacs-lsp/lsp-treemacs
(use-package lsp-treemacs :defer 5
  :config
  (lsp-treemacs-sync-mode 1))

(provide 'setup-treemacs)
