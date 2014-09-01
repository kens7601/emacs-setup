(message "Defining Utilities")

;; (defun delete-current-line (&optional arg)
;;   (interactive "p")
;;   (let ((here (point)))
;;     (beginning-of-line)
;;     (kill-line arg)
;;     (goto-char here)))

;------------------------------------------------------------------------------
;Creating new headlines insert inactive timestamps automatically
;------------------------------------------------------------------------------
(defun bh/insert-inactive-timestamp ()
  (interactive)
  (org-insert-time-stamp nil t t nil nil nil))

(defun bh/insert-heading-inactive-timestamp ()
  (save-excursion
    (org-return)
    (org-cycle)
    (bh/insert-inactive-timestamp)))

(defun insert-date ()
    "Inserts standard date time string." 
    (interactive)
    (insert (format-time-string "%Y-%m-%d")))

(defun insert-user-timestamp ()
  "Insert a quick timestamp using the value of `user-initials'."
  (interactive)
  (insert (format-time-string "%Y-%m-%d %H:%M:%S" (current-time))))

(defun gtd ()
   (interactive)
   (find-file "~/org/gtd.org")
)

;; (defun vimorg-tag-adjust ()
;;      (interactive)
;;          (while (re-search-forward "^*.*?\n[ \t]+:[^ \t]+:" nil t)
;;                           (if (not (string-match "\\(PROPERTIES\\|LOGBOOK\\)" (thing-at-point 'line)))
;;                                            (join-line))))
 
;; (defun vimorg-set-unmodified ()
;;         (interactive)
;;              (set-buffer-modified-p nil))

(defvar count-words-buffer
  nil
  "*Number of words in the buffer.")

(defun wicked/update-wc ()
  (interactive)
  (setq count-words-buffer (number-to-string (count-words-buffer)))
  (force-mode-line-update))
  
; only setup timer once
(unless count-words-buffer
  ;; seed count-words-paragraph
  ;; create timer to keep count-words-paragraph updated
  (run-with-idle-timer 1 t 'wicked/update-wc))

;; add count words paragraph the mode line
(unless (memq 'count-words-buffer global-mode-string)
  (add-to-list 'global-mode-string "words: " t)
  (add-to-list 'global-mode-string 'count-words-buffer t)
  (add-to-list 'global-mode-string " " t)) 

;; count number of words in current paragraph
(defun count-words-buffer ()
  "Count the number of words in the current paragraph."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (let ((count 0))
      (while (not (eobp))
        (forward-word 1)
        (setq count (1+ count)))
      count)))

