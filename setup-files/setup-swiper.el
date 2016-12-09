;; Time-stamp: <2016-12-09 12:28:41 csraghunandan>

;; swiper
;; https://github.com/abo-abo/swiper
;; isearch with an overview!
(use-package swiper
  :bind (:map isearch-mode-map
              ("C-c s" . swiper-from-isearch)) ; isearch > swiper
  :bind
  (("C-s" . counsel-grep-or-swiper)
   ("C-S-s" . swiper-all))
  :config
  (setq swiper-action-recenter t))

(provide 'setup-swiper)

;; swiper
;; press `M-n' to select the symbol at point in swiper
;; press `C-c s' to search regexp from isearch to swiper
;; press `C-S-s' to search all the open files(can be slow)
