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

;;; * Everything was cleaned and written during Christmas 2014. 

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
;;; showing me "psychoanalyze-pinhead", amongst others, which was really
;;; funny.  He e-mailed me his dotemacs file named as "dotemacs", which
;;; gave me the idea of naming it like that.

;;; Balaji (Yahoo!) also sent me his dotemacs, which can be found at
;;; https://github.com/balajijegan/dotfiles/blob/master/emacs/.emacs.
;;; He heavily uses GNUS, so GNUS enthusiasts can try some of his tweaks.

;;; End of history
;;; ==============

;;;Master list of packages

;;; ac-helm projectile helm-projectile sublime-themes openwith

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
(setq ispell-program-name "/usr/bin/aspell")

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

;;; Adding Melpa repositories
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;;; Adding load path for MELPA packages
(add-to-list 'load-path "~/.emacs.d")

;;; load custom theme
;;; package to install: sublime-themes
(load-theme 'wilson t)

;;; load Helm
;;; packages to install: ac-helm
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)

;;; Load Projectile
;;; packages to install: projectile helm-projectile
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;;; Open PDFs in evince
package to install: openwith
(require 'openwith)
(setq openwith-associations '(("\\.pdf\\'" "evince" (file))))
(openwith-mode t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "1a85b8ade3d7cf76897b338ff3b20409cb5a5fbed4e45c6f38c98eee7b025ad4" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "46fd293ff6e2f6b74a5edf1063c32f2a758ec24a5f63d13b07a20255c074d399" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "7bde52fdac7ac54d00f3d4c559f2f7aa899311655e7eb20ec5491f3b5c533fe8" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "ed5af4af1d148dc4e0e79e4215c85e7ed21488d63303ddde27880ea91112b07e" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


