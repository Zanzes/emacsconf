(use-package better-defaults
  :ensure t)

;;(use-package exwm
;;  :ensure t
;;  :config
;;  (require 'exwm-config)
;;  (exwm-config-default)
;;  (exwm-config-ido))
;;

;;(setq exwm-workspace-number 3)

;;(require 'exwm-randr)
;;(setq exwm-randr-workspace-output-plist '(1 "DVI-D-0" 0 "DP-1" 2 "DVI-I-1"))
;;(exwm-randr-enable)

;;  (setq exwm-input-global-keys
;;	`(
;;	  ([?\s-d] . (lambda (command)
;;		       (interactive (list (read-shell-command "$ ")))
;;		       (start-process-shell-command command nil command)))))

;; (use-package dmenu
  ;; :ensure t
  ;; :bind
   ;;("s-SPC" . 'dmenu))

(fringe-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(defalias 'yes-or-no-p 'y-or-n-p)

(server-start)

;  (exwm-enable)

(use-package volume
  :ensure t)

(global-set-key (kbd "<XF86AudioMute>") 'volume)
(global-set-key (kbd "<XF86AudioRaiseVolume>") 'volume-raise)
(global-set-key (kbd "<XF86AudioLowerVolume>") 'volume-lower)

(use-package avy
  :ensure t
  :bind
  ("M-s" . avy-goto-char))

(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)

(setq ibuffer-expert t)

(global-set-key (kbd "C-x b") 'ibuffer)

(defun kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-current-buffer)

;;(global-subword-mode 1)

(setq electric-pair-pairs '(
			    (?\( . ?\))
			    (?\[ . ?\])
			    (?\{ . ?\})
			    ))
(electric-pair-mode t)

(defun killl-word()
  (interactive)
  (backward-kill-word 1)
  (kill-word 1))
(global-set-key (kbd "C-c w w") 'killl-word)

(defun copy-line ()
  (interactive)
  (move-to-column 0)
  (kill-line))
(global-set-key (kbd "C-c w l") 'copy-line)

(use-package hungry-delete
  :ensure t
  :config (global-hungry-delete-mode))

(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package rainbow-mode
  :ensure t
  :init (add-hook 'prog-mode-hook 'rainbow-mode))

(add-to-list 'org-structure-template-alist
	     '("el" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC"))

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package popup-kill-ring
  :ensure t
  :bind ("M-y" . popup-kill-ring))

(defun open-lzconf()
  (interactive)
  (find-file "~/.emacs.d/lzconf.org"))
(global-set-key (kbd "C-c e") 'open-lzconf)

(defun open-initel()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "C-c C-x e") 'open-initel)

(defun reload-lzconf ()
  (interactive)
  (org-babel-load-file (expand-file-name "~/.emacs.d/lzconf.org")))
(global-set-key (kbd "C-c r") 'reload-lzconf)

(use-package beacon
  :ensure t
  :init
  (beacon-mode 1))

;;  (global-hl-line-mode t)

(setq inhibit-startup-screen t)

(setq initial-scratch-message "")

(setq split-width-threshold 0)
(setq split-height-threshold nil)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents . 16)))
  (setq dashboard-banner-logo-title "You have gained access to this system. Remember with great power comes great responsibility."))

(setq create-lockfiles nil)
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
(setq default-directory "~/dev/")

(setq org-default-notes-file (expand-file-name "~/org/notes.org"))

(use-package golden-ratio
    :ensure t)
(golden-ratio-mode -1)
(setq split-width-threshold nil)

(setq scroll-conservatively 100)

(setq ido-enable-flex-matching nil)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere 1)
(ido-mode 1)

(use-package ido-vertical-mode
  :ensure t
  :init
  (ido-vertical-mode 1))

;;(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind
  ("M-x" . smex))

(use-package switch-window
  :ensure t
  :config
  (setq switch-window-input-style 'minibuffer)
  (setq switch-window-increase 4)
  (setq switch-window-threshold 2)
  (setq switch-window-shortcut-style 'qwerty)
  (setq switch-window-qwerty-shortcuts
	'("a" "s" "d" "f" "g" "h" "i" "j" "k"))
  :bind
  ([remap other-window] . switch-window))

(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(setq display-time-default-load-average nil)

(setq display-time-24hr-format t)
(display-time-mode 1)

;;(use-package which-key
;;  :ensure t
;;  :init
;;  (which-key-mode))

(line-number-mode 1)
(column-number-mode 1)

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator (quote arrow))
  (spaceline-emacs-theme))

(defun my-terminal-visible-bell ()
   (invert-face 'mode-line)
   (run-with-timer 0.1 nil 'invert-face 'mode-line))

(setq visible-bell nil
      ring-bell-function 'my-terminal-visible-bell)

(use-package org-alert
  :ensure t)
(org-alert-enable)
(setq alert-default-style 'libnotify)

(global-set-key (kbd "C-c l") 'org-store-link)

(global-set-key (kbd "C-c a") 'org-agenda)

(global-set-key (kbd "C-c c") 'org-capture)

;  (setq org-indent-indentation-per-level 4)

(add-hook 'org-mode-hook 'org-indent-mode)

(setq org-ellipsis " »")
;;(setq org-ellipsis '((t (:foreground "LightGoldenrod" :underline nil))))

(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-confirm-babel-evaluate nil)
(setq org-export-with-smart-quotes t)
(setq org-src-window-setup 'current-window)

;;  (use-package org-plus-contrib
;;    :ensure t)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))

(setq org-src-window-setup 'current-window)

(defun org-agenda-show-agenda-and-todo (&optional arg)
  (interactive "P")
  (org-agenda arg "n"))

(global-set-key (kbd "C-c a") 'org-agenda-show-agenda-and-todo)

(org-agenda-files (quote ("~/org/todo.org")))

(setq org-log-into-drawer t)

(setq org-pretty-entities t)

(defun org-show-two-levels ()
  (interactive)
  (org-content 2))

(defun propper-show-headings ()
  (interactive)
  (outline-show-entry)
  (outline-show-children))

(add-hook 'org-mode-hook 
          (lambda ()
            (org-map-entries 'propper-show-headings "LEVEL=1")))

(use-package elpy
  :ensure t)

(defvar zshell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list zshell)))
(ad-activate 'ansi-term)

;;(global-set-key (kbd "M-<return>") 'ansi-term)

(use-package sudo-edit
  :ensure t
  :bind ("S-e" . sudo-edit))

;;(custom-theme-set-faces
;; 'user
;; `(org-level-8 ((t (,@headline ,@variable-tuple))))
;; `(org-level-7 ((t (,@headline ,@variable-tuple))))
;; `(org-level-6 ((t (,@headline ,@variable-tuple))))
;; `(org-level-5 ((t (,@headline ,@variable-tuple))))
;; `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
;; `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.1))))
;; `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.2))))
;; `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.5))))
;; `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil)))))

(global-prettify-symbols-mode t)
(when window-system
  (use-package pretty-mode
    :ensure t
    :config
    (global-pretty-mode t)
    (add-hook 'prog-mode-hook 'pretty-mode)))

(use-package swiper
  :ensure t
  :bind ("C-s" . swiper))

(use-package mark-multiple
  :ensure t
  :bind ("C-c q" . 'mark-next-like-this))

(use-package expand-region
  :ensure t
  :bind ("C-q" . er/expand-region))

(setq org-todo-keywords
      '((sequence "TODO(t!/!)" "IMPORTANT(i!/!)" "ACTIVE(a!/!)" "|" "DONE(d!/!)")))

(setq org-todo-keyword-faces
  '(("TODO" . "red")
   ("DONE" . "green")
   ("IMPORTANT" . "red")
   ("ACTIVE" .  "deep sky blue")
   ("On" . "green")
   ("Off" . "red")))
