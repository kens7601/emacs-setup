(message "bbdb stuff")

(load "bbdb-com" t)
(bbdb-initialize 'gnus 'message-x 'sc)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(bbdb-insinuate-message)
(bbdb-insinuate-sc)
(setq sc-preferred-attribution-list
  '("sc-lastchoice" "x-attribution" "sc-consult"
    "initials" "firstname" "lastname"))
(setq bbdb/mail-auto-create-p t)
(setq bbdb/news-auto-create-p t)
(setq bbdb-always-add-addresses t)

(bbdb-mua-auto-update-init 'gnus 'message)
(setq bbdb-update-records-p 'create)

(setq bbdb-use-pop-up t)
(setq bbdb-send-mail-style 'gnus)
(setq bbdb-complete-name-full-completion t)
(setq bbdb-completion-type 'primary-or-name)
(setq bbdb-complete-name-allow-cycling t)
(setq
     bbdb-offer-save 1
     bbdb-use-pop-up t
     bbdb-electric-p t
     bbdb-popup-target-lines  1
)
(setq sc-mail-glom-frame
      '((begin                        (setq sc-mail-headers-start (point)))
        ("^x-attribution:[ \t]+.*$"   (sc-mail-fetch-field t) nil t)
        ("^\\S +:.*$"                 (sc-mail-fetch-field) nil t)
        ("^$"                         (progn (bbdb/sc-default)
                                             (list 'abort '(step . 0))))
        ("^[ \t]+"                    (sc-mail-append-field))
        (sc-mail-warn-if-non-rfc822-p (sc-mail-error-in-mail-field))
        (end                          (setq sc-mail-headers-end (point)))))
