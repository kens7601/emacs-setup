(message "Settings")

(setq inhibit-startup-screen t)
(setq read-buffer-completion-ignore-case t)
(setq completion-ignore-case t)
(setq bookmark-default-file "~/.emacs.d/bookmarks.txt")
(setq bookmark-save-flag 1)
(line-number-mode 1)
(column-number-mode 1)
(autopair-global-mode) ;;to enable in all buffers
(setq auto-save-interval 100)
(setq auto-save-timeout 15)
(setq version-control t)
(add-hook 'before-save-hook 'py-autopep8-before-save)
(icy-mode 1)
(flyspell-mode 1)
(semantic-mode 1)

(setq load-prefer-newer t)
(auto-compile-on-load-mode 1)
(auto-compile-on-save-mode 1)

(setq-default major-mode 'text-mode)

(setq org-default-notes-file "~/org/gtd.org")
(setq org-remember-templates  ;; mail-specific note template, identified by "m"
      '(("Mail" ?m "* %?\n\n  Source: %u, %c\n  %i" nil)))

(setq calendar-mark-diary-entries-flag t)
(setq diary-number-of-entries 7)

(setq display-time-day-and-date t)

(setq mm-attachment-override-p '("image/.*"))

(global-ede-mode t)

(browse-url-dwim-mode 1)


