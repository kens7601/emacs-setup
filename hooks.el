(message "Setting up hooks")

(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)
(add-hook 'diary-list-entries-hook 'diary-sort-entries t)
(add-hook 'sql-mode 'sqlup-mode)

(add-hook 'text-mode-hook 'flycheck-mode)
(add-hook 'org-mode-hook 'flycheck-mode)
(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'org-remember-mode-hook 'delete-other-windows)
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

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

(add-hook 'mail-setup-hook 'bbdb-insinuate-sendmail)
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)

(add-hook 'c-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-c-headers)
            (add-to-list 'ac-sources 'ac-source-c-header-symbols t)))
