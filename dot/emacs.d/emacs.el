(setq inhibit-startup-screen t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(toggle-scroll-bar 0)

(setq create-lockfiles nil)
    (setq delete-by-moving-to-trash t)

  ; I dunno I put emacs-client stuff here too.
(server-start)

(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-startup-banner "/home/jalen/pic/komi_food_dashboard.png")
(setq dashboard-set-init-info nil)
(setq dashboard-banner-logo-title "Welcome to your comfy home of Emacs!")
(setq dashboard-week-agenda nil)
(setq dashboard-show-shortcuts nil)
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)

(use-package helm
    :straight t
    :config)
;  (use-package helm-firefox
;    :config
;    (autoload 'helm-firefox-bookmarks "helm-firefox" nil t))



(use-package org-mobile-sync)
    (use-package org
	:hook (org-mode . pandoc-mode)
	:config
	(setq org-ellipsis " ▾")
	(setq org-startup-truncated nil)
	(setq org-directory "~/org")
	(setq org-mobile-inbox-for-pull "~/org/flagged.org")
	(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
	(org-reload))


      (setq org-confirm-babel-evaluate nil)
      (org-babel-do-load-languages
	 'org-babel-load-languages
	 '((emacs-lisp . t)
	   (shell . t)
	   (latex . t)
	   (python . t)
	   (java . t)))
      (use-package org-superstar
	 :after org
	 :hook (org-mode . org-superstar-mode)
	 :custom
	 (org-superstar-remove-leading-stars t)
	 (org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●")))

      (defun jm/org-mode-visual-fill ()
	(setq visual-fill-column-width 100
	      visual-fill-column-center-text t)
	(visual-fill-column-mode 1))

      (use-package visual-fill-column
	:hook (org-mode . jm/org-mode-visual-fill))

(with-eval-after-load 'org
    (custom-set-faces
     '(org-block-begin-line
       ((t (:underline "#2c3535" :foreground "#adbbbb" :background "#0a0c0d"))))
     '(org-block
       ((t (:background "#111517"))))
     '(org-block-end-line
       ((t (:overline "#2c3535" :underline "#0a0c0d" :foreground "#adbbbb" :background "#0a0c0d"))))))

;(load-theme 'ewal t)
(use-package ewal
   :init (setq ewal-use-built-in-always-p nil 
               ewal-use-built-in-on-failure-p t
	       ewal-evil-cursors-obey-evil-p t
	       ewal-built-in-palette "sexy-material")
   (ewal-load-colors))
;(set-foreground-color "#f1f1f1")
;(set-background-color "#1c1e27")
(set-mouse-color "white")

;(setq exwm--mode-line-format
;  (list
;   "%b"
;   (getenv "USER")))

(display-battery-mode 1)
(setq battery-mode-line-format "%b%B")
(setq display-time-day-and-date t)
(setq display-time-format "%b %d %I:%M %p")
(display-time-mode 1)

(use-package doom-modeline
  :demand t
  :custom
  (doom-modeline-buffer-file-name-style 'truncate-all)
  (doom-modeline-bar-width (frame-parameter nil 'left-fringe))
  (doom-modeline-height 12)
  (doom-modeline-icon t)
  (doom-modeline-icons-scale-factor 0.8)
  (doom-modeline-mode t))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config (setq which-key-idle-delay 0.2))

(use-package general
  :config
  (general-evil-setup nil))

(defun vol-up ()
  (interactive)
  (shell-command "amixer set Master 5%+"))
(defun vol-down ()
  (interactive)
  (shell-command "amixer set Master 5%-"))
(defun vol-mute ()
  (interactive)
  (shell-command "amixer -q sset Master toggle"))
(defun rbright ()
  (interactive)
  (shell-command "xbacklight -inc 5"))
(defun lbright ()
  (interactive)
  (shell-command "xbacklight -dec 5"))

(defun load-init ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun pdf-latex ()
  (interactive)
  (shell-command "pdflatex ./*.tex"))

(defun poinkalum/invoke-firefox ()
  "If firefox exists, switch to its buffer or else launch it"
  (interactive) 
  (if (string= (buffer-name) "Firefox-esr") (bury-buffer)
  (if (get-buffer "Firefox-esr")
      (exwm-workspace-switch-to-buffer "Firefox-esr")
      (my/exwm-async-run "firefox")))) 

(defun inkscape ()
  (interactive)
  (shell-command "if [[ ! -d ]]; then mkdir figures fi")
  (shell-command (message "inkscape-figures create ./figures/%s &" (read-string "Inkscape File: ")))
  (basic-save-buffer))

;(load "/home/jalen/.emacs.d/keys.el")
   (general-define-key
     "M-<tab>" 'other-window
     "M-s" 'switch-to-buffer-other-window
     "C-<tab>" 'counsel-ibuffer
     "<escape>" 'keyboard-escape-quit
     "M-M" 'global-visual-fill-column-mode
     "M-t" 'pdf-latex
     "M-f" 'inkscape
     "C-f" 'poinkalum/invoke-firefox 
     "M-x" 'helm-M-x
     "C-<tab>" 'helm-buffers-list
     "C-x C-f" 'helm-find-files
     "<XF86AudioRaiseVolume>" 'vol-up
     "<XF86AudioLowerVolume>" 'vol-down
     "<XF86AudioMute>" 'vol-mute
     "<XF86MonBrightnessDown>" 'lbright
     "<XF86MonBrightnessUp>" 'rbright)

   (general-def org-mode-map
    "C-SPC C-e" 'load-init
    "C-<tab>" 'helm-buffers-list)

(general-def helm-map
   "<tab>" 'helm-execute-persistent-action)

(use-package use-package-chords
  :disabled
  :config (key-chord-mode 1))

;(auto-indent-global-mode)

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line))

;(setq internal-border-width 30)
(use-package default-text-scale
  :defer 1
  :config
  (default-text-scale-mode))

(add-hook 'find-file-hook (lambda () (linum-mode t)))
(setq column-number-mode t)
;(setq auto-fill-mode t)
;(global-visual-line-mode)
(setq global-visual-fill-column-mode nil)
(set-display-table-slot standard-display-table 'wrap ?\ )
(setq linum-format "%4d   ")

(set-frame-parameter (selected-frame) 'alpha '(90 . 90))
(add-to-list 'default-frame-alist '(alpha . (90 . 90)))
;(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
;(add-to-list 'default-frame-alist '(fullscreen . maximized))

(load "/home/jalen/.emacs.d/methods.el")

;(require 'cl)
;(autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t)
;(add-to-list 'auto-mode-alist '("\.ino$" . arduino-mode))

(add-hook 'LaTeX-mode-hook #'outline-minor-mode)
(global-unset-key "\C-z")
(setq outline-minor-mode-prefix "\C-z")
(add-hook 'LaTeX-mode-hook (lambda ()
                              (TeX-fold-mode 1)))
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)			
(add-hook 'LaTeX-mode-hook 'TeX-PDF-mode)
;(latex-preview-pane-enable)

(yas-global-mode)
(add-hook 'yas-minor-mode-hook (lambda ()
                                  (yas-activate-extra-mode 'fundamental-mode)))
