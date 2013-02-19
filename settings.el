(setq read-buffer-completion-ignore-case t)
(setq completion-ignore-case t)
(setq bookmark-default-file "~/.emacs.d/bookmarks.txt")
(setq bookmark-save-flag 1)
(line-number-mode 1)
(column-number-mode 1)
(setq auto-save-interval 100)
(setq auto-save-timeout 15)
(setq version-control t)
(icy-mode 1)

(setq org-directory "~/org/")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-agenda-include-diary t)

(setq org-remember-templates
      '(("Todo" ?t "* TODO %?\n  %i\n  %a" "~/org/TODO.org" "Tasks")
        ("Journal" ?j "* %U %?\n\n  %i\n  %a" "~/org/JOURNAL.org")
        ("Idea" ?i "* %^{Title}\n  %i\n  %a" "~/org/JOURNAL.org" "New Ideas")))

(setq view-diary-entries-initially t
      mark-diary-entries-in-calendar t
      number-of-diary-entries 7)


(setq org-deadline-warning-days 7)
(setq org-timeline-show-empty-dates t)
(setq org-insert-mode-line-in-empty-file t)
(setq org-log-done t)
(setq org-agenda-files
      (list "~/org/gtd.org" "~/org/birthday.org"))

(setq org-agenda-ndays 7)

; I prefer return to activate a link
(setq org-return-follows-link t)
 
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
(setq display-time-day-and-date t)
