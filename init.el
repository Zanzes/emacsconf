(require 'package)

(setq package-enable-at-startup nil)

(setq package-archives '(("marmalade" . "http://marmalade-repo.org/packages/")
			 ("ELPA"  . "http://tromey.com/elpa/")
			 ("gnu"   . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (manoj-dark)))
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-ellipsis ((t (:inherit nil :foreground "dark magenta" :underline nil))))
 '(org-level-1 ((t (:foreground "LightSkyBlue" :height 1.2))))
 '(org-level-2 ((t (:foreground "LightGoldenrod" :height 1.1)))))

(org-babel-load-file (expand-file-name "~/.emacs.d/lzconf.org"))
