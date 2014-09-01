(message "setting up org mode")

(add-to-list 'auto-mode-alist '("\\.org$'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.org$'" . remember-mode))

(setq org-directory "~/org")
(setq org-mobile-inbox-for-pull "~/org/")

(setq org-mobile-directory "~/DropBox/MobileOrg")

(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-agenda-include-diary t)

(setq org-remember-templates
      '(("Todo" ?t "* TODO %?\n  %i\n  %a" "~/org/TODO.org" "Tasks")
        ("Journal" ?j "* %U %?\n\n  %i\n  %a" "~/org/JOURNAL.org")
        ("Idea" ?i "* %^{Title}\n  %i\n  %a" "~/org/JOURNAL.org" "New Ideas")))

(setq org-deadline-warning-days 7)
(setq org-timeline-show-empty-dates t)
(setq org-insert-mode-line-in-empty-file t)
(setq org-log-done t)
(setq org-agenda-files
      (list "~/org/gtd.org" "~/org/birthday.org"))

(setq org-agenda-ndays 7)

; I prefer return to activate a link
(setq org-return-follows-link t)

(setq org-html-doctype "xhtml5")
(setq org-html-html5-fancy t)
(setq org-agenda-custom-commands
'(
("P" "Projects"   
((tags "PROJECT")))

("H" "Office and Home Lists"
     ((agenda)
          (tags-todo "OFFICE")
          (tags-todo "HOME")
          (tags-todo "COMPUTER")
          (tags-todo "DVD")
          (tags-todo "READING")
	  (tags-todo "BILLS")))

("D" "Daily Action List"
     (
          (agenda "" ((org-agenda-ndays 1)
                      (org-agenda-sorting-strategy
                       (quote ((agenda time-up priority-down tag-up) )))
                      (org-deadline-warning-days 0)
                      ))))
)
)

(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)

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

(setq org-log-done 'time)

(add-hook 'org-insert-heading-hook 'bh/insert-heading-inactive-timestamp)
                                        ;
(org-agenda-list)
