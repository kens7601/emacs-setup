;;;;Ken's .emacs file
; Kenneth Stevens
; February 16, 2013

(setq emacs-load-start-time (current-time))
(setq message-log-max 16384)

(defconst emacs-start-time (current-time))

(load "~/.emacs.d/build_load_path")
(load "~/.emacs.d/kenrequires")
(load "~/.emacs.d/utilities")
(load "~/.emacs.d/keybindings")
(load "~/.emacs.d/settings")
(load "~/.emacs.d/autoloads.el")
(load "~/.emacs.d/hooks.el")

;Text mode will be default major=mode
(setq-default major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(setq colon-double-space t)
(setq-default indent-tabs-mode nil)
(show-paren-mode)
(org-remember-insinuate)

(add-to-list 'auto-mode-alist '("\\.org$'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.org$'" . remember-mode))

;;; Organoze the stuff in here evenyually
(load "~/.emacs.d/rest_of_stuff.el")

(display-time)
(calendar)
