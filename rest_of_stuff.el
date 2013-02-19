(setq org-default-notes-file "~/org/gtd.org")
(setq org-remember-templates  ;; mail-specific note template, identified by "m"
      '(("Mail" ?m "* %?\n\n  Source: %u, %c\n  %i" nil)))

(add-hook 'org-remember-mode-hook 'delete-other-windows)
(setq my-org-protocol-flag nil)

(defadvice org-remember-finalize (after delete-frame-at-end activate)
  "Delete frame at remember finalization"
  (progn (if my-org-protocol-flag (delete-frame))
     (setq my-org-protocol-flag nil)))
(defadvice org-remember-kill (after delete-frame-at-end activate)
  "Delete frame at remember abort"
  (progn (if my-org-protocol-flag (delete-frame))
     (setq my-org-protocol-flag nil)))
(defadvice org-protocol-remember (before set-org-protocol-flag activate)
  (setq my-org-protocol-flag t))

(defun open-mail-in-mutt (message)
  "Open a mail message in Mutt, using an external terminal.

Message can be specified either by a path pointing inside a
Maildir, or by Message-ID."
  (interactive "MPath or Message-ID: ")
  (shell-command
   (format "gnome-terminal -e \"%s %s\""
       (substitute-in-file-name "$HOME/bin/mutt-open") message)))

;; add support for "mutt:ID" links
(org-add-link-type "mutt" 'open-mail-in-mutt)

(load-file "~/git/emacs-for-python/epy-init.el")

(add-to-list 'load-path "~/git/emacs-for-python/")
(require 'epy-setup)
(require 'epy-python)
(require 'epy-completion)
(require 'epy-editing)
(require 'epy-bindings)
(require 'epy-nose)

(epy-django-snippets)
(epy-setup-ipython)

;------------------------------------------------------------------------------
;Creating new headlines insert inactive timestamps automatically

(defun bh/insert-inactive-timestamp ()
(interactive)
(org-insert-time-stamp nil t t nil nil nil))

(defun bh/insert-heading-inactive-timestamp ()
(save-excursion
(org-return)
(org-cycle)
(bh/insert-inactive-timestamp)))

(add-hook 'org-insert-heading-hook 'bh/insert-heading-inactive-timestamp)
;
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)

(setq tags-revert-without-query t)
(global-set-key (kbd "<f7>") 'ctags-create-or-update-tags-table)

(add-hook 'dired-load-hook
           (lambda ()
             (load "dired-x")
                 ;; Set dired-x global variables here.  For example:
                 ;; (setq dired-guess-shell-gnutar "gtar")
                 ;; (setq dired-x-hands-off-my-keys nil)
                 ))
(add-hook 'dired-mode-hook
           (lambda ()
                 ;; Set dired-x buffer-local variables here.  For example:
                 ;; (dired-omit-mode 1)
))
 
