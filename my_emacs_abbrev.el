(message "My Personal abbreviation")

; my personal abbreviations

(define-abbrev-table 'global-abbrev-table '(

          ("8org" "#   -*- mode: org -*-")
          ("8cc" "Copyright 2014 Ken Stevens, all rights reserved.")
          ("8ruby" "#!/usr/bin/ruby")
          ("8python" "#!/usr/bin/python3")
          )
  )

(setq save-abbrevs nil)
(setq-default abbrev-mode t)
