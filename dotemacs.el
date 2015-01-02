;;; Bodhi's dotemacs
;;; ================

;;; Created:  Sometime during August 2011, when I was working in
;;;           Virtual Labs

;;; Versions: Unknown.  Must be in hundreds by now, given the number
;;; of experiments that has gone through it.  Have to keep it in
;;; version control somehow.

;;; This file is released under CC-by-NC-SA v3.0.
;;; http://creativecommons.org/licenses/by-nc-sa/3.0/

;;; History of my dotemacs
;;; ======================

;;; Most of the initial customizations are borrowed from
;;; Prof. Venkatesh Choppella, my Emacs guru.  Some of my
;;; customizations somehow found way into his dotemacs.  He also taught me to
;;; write Elisp, org-mode, Scheme, scribble and only a ton of other
;;; things.  He also writes pretty awesome Makefiles.

;;; Profs. Jaya Sreevalsan Nair and Shrisha Rao were kind enough to
;;; lend their dotemacs files as well.  I use the linum-mode suggested
;;; by Prof. Nair.  Coincidentally, Prof. Nair also taught me how to use
;;; Emacs.  She is also my official LaTeX guru.  Prof. Rao was kind of
;;; psyched when I asked him to show me a few tricks, he ended up
;;; showing me "psychoanalysis-pinhead", amongst others, which was really
;;; funny.  He e-mailed me his dotemacs file named as "dotemacs", which
;;; gave me the idea of naming it like that.

;;; Balaji (Yahoo!) also sent me his dotemacs, which can be found at
;;; https://github.com/balajijegan/dotfiles/blob/master/emacs/.emacs.
;;; He heavily uses GNUS, so GNUS enthusiasts can try some of his tweaks.

;;; End of history
;;; ==============

;;; For full screen on starting Emacs
(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
)
(toggle-fullscreen)

;;; To disable the splash screen
(setq inhibit-splash-screen t)

;;; No Menu Bar
(menu-bar-mode -1)
;;; No tool bar
(tool-bar-mode -1)

;;; No Scrollbar
(scroll-bar-mode -1)

;;; To show date and time
(display-time-mode 1)

;;; Turn on Linum-mode
(add-hook 'find-file-hook '(lambda () (linum-mode t)))

;;; Show Column Number
(setq column-number-mode t)

;;; Ido Mode
(require 'ido)
(ido-mode t)

;;; Autocomplete


;;; Midnight Mode - Kills buffers which are inactive for a long time
(require 'midnight)
(midnight-delay-set 'midnight-delay "12:00am")

;;; Use aspell instead of ispell.  I read somewhere that aspell was
;;; better than ispell.  Moreover, aspell comes default in
;;; Debian-based systems, whereas ispell does not.
;;; ALERT: To set aspell as the default spell-check
;;; you might need to install aspell and aspell-en
(setq-default ispell-program-name "aspell")

;;; Set English as the default dictionary
(setq ispell-dictionary "en")

;;; Turn on flyspell mode
(defun turn-on-flyspell () (flyspell-mode t))
(add-hook 'find-file-hooks 'turn-on-flyspell)

;;; Turn on Auto-fill
(add-hook 'find-file-hooks 'turn-on-auto-fill)



;;; Turn on parentheses match highlighting
(show-paren-mode 1)

;;; Turn on Syntax Coloring
(global-font-lock-mode 1)

;;; Math mode for LaTeX (obtained from http://www.terminally-incoherent.com/blog/2007/12/13/emacs-with-auctex-as-a-latex-ide/)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;;; Global Keys
(global-set-key "\C-cc" 'compile) ;Compile shortcut
(global-set-key "\C-c\C-g" 'goto-line) ; Goto-line
(global-set-key "\C-xk" 'kill-this-buffer) ; Kill buffer without confirmation

;;; Show Filename on Titlebar
(setq frame-title-format
     (concat  "%b - Emacs@" system-name))

;;; Scroll one line at a time
(setq scroll-lock-mode t)
(setq scroll-step 1)


;;; Org-indent-mode for hiding unnecessary *
(add-hook 'org-mode-hook
          (lambda ()
            (org-indent-mode t))
          t)

;;; Use y/n instead of  yes/no
(defalias 'yes-or-no-p 'y-or-n-p)



;;; Some of the following set of stuff is borrowed from Sankalp's .emacs

;;; turn on visual bell
(setq visible-bell t)

;;; If at beginning of a line, don't make me C-k twice.
(setq kill-whole-line t)

;;; Setting default font-size applies to all buffers :: Taken from
;;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 120)

;;; Adding Melpa repositories
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;;; Adding load path for MELPA packages
(add-to-list 'load-path "~/.emacs.d")

;;; load hipster theme
(load-theme 'hipster t)

;;; load Helm
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)

;;; Load Projectile
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("ed5af4af1d148dc4e0e79e4215c85e7ed21488d63303ddde27880ea91112b07e" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


