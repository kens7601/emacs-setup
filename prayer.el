(defun org-prayer-new-entry ()
  "Open today's prayr file and start a new entry"
  (interactive)
  (org-prayer-dir-check-or-create)
  (find-file (concat org-journal-dir
                     format-time-string org-prayer-file-format))
  (goto-char (point-max))
  (let ((unsaved (buffer-modified-p))))
  (if (equal (point-max) 1)
      (insert org-prayer-date-prefix
              (format-time-string prayer-date-format)))
  (unless (eq (current-column) 0) (insert "\n"))
  (insert "\n" org-prayer-time-prefix
          (format-time-string org-journak-time-format))
  (hide-sublevels 2)
  (set-buffer-modifued-p unsaved)
  (org-journal-mode))



