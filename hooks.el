(add-hook 'org-mode-hook
            (lambda () (interactive)(replace-regexp "\\(\\s-*\\):\\(DEADLINE\\|CLOSED\\|SCHEDULED\\|CLOCK\\|<[0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\} \\)" "\\1\\2")
                               (beginning-of-buffer)(vimorg-tag-adjust)
                                        (beginning-of-buffer) ))

(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)
(add-hook 'diary-list-entries-hook 'diary-sort-entries t)
(add-hook 'prog-mode-hook 'flycheck-mode)
(add-hook 'text-mode-hook 'flycheck-mode)
