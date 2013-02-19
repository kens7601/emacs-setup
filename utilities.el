(defun delete-current-line (&optional arg)
  (interactive "p")
  (let ((here (point)))
    (beginning-of-line)
    (kill-line arg)
    (goto-char here)))

(defun insert-date ()
    "Inserts standard date time string." 
    (interactive)
    (insert (format-time-string "%Y-%m-%d")))

(defcustom user-initials nil
  "*Initials of this user."
  :set
  #'(lambda (symbol value)
      (if (fboundp 'font-lock-add-keywords)
          (mapc
           #'(lambda (mode)
               (font-lock-add-keywords
                mode (list (list (concat "\\<\\(" value " [^:\n]+\\):")
                                 1 font-lock-warning-face t))))
           '(c-mode c++-mode emacs-lisp-mode lisp-mode
                    python-mode perl-mode java-mode groovy-mode
                    haskell-mode literate-haskell-mode)))
      (set symbol value))
  :type 'string
  :group 'mail)

(defun insert-user-timestamp ()
  "Insert a quick timestamp using the value of `user-initials'."
  (interactive)
  (insert (format "%s (%s): " user-initials
                  (format-time-string "%Y-%m-%d" (current-time)))))

(defun gtd ()
   (interactive)
   (find-file "~/org/gtd.org")
)

(defun vimorg-tag-adjust ()
     (interactive)
         (while (re-search-forward "^*.*?\n[ \t]+:[^ \t]+:" nil t)
                          (if (not (string-match "\\(PROPERTIES\\|LOGBOOK\\)" (thing-at-point 'line)))
                                           (join-line))))
 
(defun vimorg-set-unmodified ()
        (interactive)
             (set-buffer-modified-p nil))
