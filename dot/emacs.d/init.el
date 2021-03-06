;;
;;                 _    
;;    __   ___.--'_`.   
;;   ( _`.'. -   'o` )    A quite awful emacs config (w/ EXWM)
;;   _\.'_'      _.-'        by: Jalen Moore
;;  ( \`. )    //\`          art by: Veronica Karlsson (Found at: www.asciiart.eu)
;;   \_`-'`---'\\__,    
;;    \`        `-\     
;;     `                  
;;

;; Setup package archives/manager
; Setup straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)




(require 'package)
(setq package-archives '(("melpa" . "http://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

;(package-initialize)
;(unless package-archive-contents
 ; (package-refresh-contents))

; Load emacs.org
(org-babel-load-file
 (expand-file-name
  "emacs.org"
  user-emacs-directory))

;; Stuff emacs adds on its own that looks ugly but it wont stop :(
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   [(\, comf-black)
    (\, comf-red)
    (\, comf-green)
    (\, comf-yellow)
    (\, comf-blue)
    (\, comf-magenta)
    (\, comf-cyan)
    (\, comf-white)])
 '(ansi-term-color-vector
   [unspecified "#2d2a2e" "#ff6188" "#a9dc76" "#ffd866" "#78dce8" "#ab9df2" "#a1efe4" "#fcfcfa"] t)
 '(cursor-type 'bar)
 '(custom-enabled-themes '(ewal-doom-vibrant use-package))
 '(custom-safe-themes
   '("e5dc5b39fecbeeb027c13e8bfbf57a865be6e0ed703ac1ffa96476b62d1fae84" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "8a379e7ac3a57e64de672dd744d4730b3bdb88ae328e8106f95cd81cbd44e0b6" "2035a16494e06636134de6d572ec47c30e26c3447eafeb6d3a9e8aee73732396" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "5846b39f2171d620c45ee31409350c1ccaddebd3f88ac19894ae15db9ef23035" "529c211e86eadecb67b6b64ffdf73e71c4337070bd9b3de053f8f7c5da9e07a2" default))
 '(helm-completion-style 'emacs)
 '(minimap-window-location 'right)
 '(package-selected-packages
   '(org-dashboard spacemacs-theme ewal-spacemacs-themes latex-preview-pane yasnippet mini-modeline pandoc-mode haskell-mode telephone-line arduino-mode visual-fill xresources-theme ewal-evil-cursors ewal visual-fill-column ewal-doom-themes base16-theme seti-theme oceanic-theme majapahit-theme doom-themes auto-indent-mode autothemer linum-off org-superstar key-chord general which-key doom-modeline diminish default-text-scale ivy-hydra counsel swiper ivy use-package helm exwm-firefox-evil evil exwm-firefox-core exwm pdf-tools sublimity vterm monokai-pro-theme smart-mode-line minimap dashboard))
 '(pos-tip-background-color "#303030")
 '(xterm-color-names
   ["#303030" "#D66F84" "#D79887" "#D49A8A" "#94B1A3" "#A8938C" "#989584" "#BAB2A9"])
 '(xterm-color-names-bright
   ["#3A3A3A" "#E47386" "#CC816B" "#769188" "#7D6F6A" "#9C8772" "#BAB2A9"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(minimap-font-face ((t (:height 30 :family "JetBrains Mono"))))
 '(org-block ((t (:background "#111517"))))
 '(org-block-begin-line ((t (:underline "#2c3535" :foreground "#adbbbb" :background "#0a0c0d"))))
 '(org-block-end-line ((t (:overline "#2c3535" :underline "#0a0c0d" :foreground "#adbbbb" :background "#0a0c0d")))))
