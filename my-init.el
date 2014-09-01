(message "My own initializations")

(load "writeroom-mode")

(setq inferior-lisp-program "/usr/bin/sbcl")
;; (add-to-list 'load-path "~/hacking/lisp/slime/")  ; _your SLIME directory_
(require 'slime)
(slime-setup)

(autoload 'dired-jump "dired-x"
    "Jump to Dired buffer corresponding to current buffer." t)

(autoload 'dired-jump-other-window "dired-x"
    "Like \\[dired-jump] (dired-jump) but in other window." t)

(define-key global-map "\C-x\C-j" 'dired-jump)
(define-key global-map "\C-x4\C-j" 'dired-jump-other-window)

(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'list-buffers 'ibuffer)

(defun kws:ibuffer-mode-func ()
  "Function for 'ibuffer-mode-hook' ."
  (ibuffer-switch-to-saved-filter-groups "default"))

(setq-default
 ibuffer-saved-filter-groups
 '("default"
   ("emacs" (or (filename . "emacs\\.d")
                (mode . emacs-lisp-mode)))
   ("work" (filename . "aethon"))
   ("jabber" (name . "^\\*jabber-"))
   ("org" (filename . ".\\.org$"))
   ("magit" (name . "^\\*magit-.*\\*$"))
   ("scratch" name . "^\\*.*\\*$")))

(add-hook 'ibuffer-mode-hook 'kws:ibuffer-mode-func)

(appt-activate)
