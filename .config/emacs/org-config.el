(provide 'org-config)

(setq org-agenda-files '("~/Dropbox/gtd"))

(setq org-capture-templates '(
                              ("t" "Todo [inbox]" entry
                               (file+headline "~/Dropbox/gtd/inbox.org" "Tasks")
                               "* TODO %a%i%?")
                              ("s" "Read [inbox]" entry
                               (file+headline "~/Dropbox/gtd/inbox.org" "Read")
                               "* TODO %:fromname %a%i%? Sichten und Einsortieren")
                              ("r" "Reply [inbox]" entry
                               (file+headline "~/Dropbox/gtd/inbox.org" "Read")
                               "* TODO %:fromname %a%i%? Antworten")
                              ("d" "Daily Review" entry (file+datetree "~/Dropbox/gtd/Reviews/Daylies.org")
                               (file "~/Dropbox/gtd/Checklists/Daily.org")
                              )
                              )
      )

(setq org-refile-targets '(("~/Dropbox/gtd/gtd.org" :maxlevel . 3)
                           ("~/Dropbox/gtd/MoKiZae.org" :maxlevel . 3)
                           ("~/Dropbox/gtd/Baugruppe.org" :maxlevel . 3)
                           ("~/Dropbox/gtd/Coding.org" :maxlevel . 3)
                           ("~/Dropbox/gtd/Home.org" :maxlevel . 3)
                           ("~/Dropbox/gtd/Archiv.org" :level . 1)
                           )
      )

(defun mu4e-mark-as-read-later()
  "Marks an E-Mail as read later"
  (interactive)
  (if (eq major-mode 'mu4e-headers-mode)
    (progn
      (mu4e-headers-mark-for-refile)
      (mu4e-headers-prev)
    )
      (mu4e-view-mark-for-refile)
  )
    (org-capture nil "s")
  )

(defun mu4e-mark-as-reply-later()
  "Marks an E-Mail as read later"
  (interactive)
  (if (eq major-mode 'mu4e-headers-mode)
      (progn
        (mu4e-headers-mark-for-refile)
        (mu4e-headers-prev)
        )
    (mu4e-view-mark-for-refile)
    )
  (org-capture nil "r")
  )

(spacemacs/set-leader-keys-for-major-mode 'mu4e-headers-mode "l" 'mu4e-mark-as-read-later)
(spacemacs/set-leader-keys-for-major-mode 'mu4e-headers-mode "r" 'mu4e-mark-as-reply-later)
(spacemacs/set-leader-keys-for-major-mode 'mu4e-compose-mode "r" 'yas-insert-snippet)

(spacemacs/set-leader-keys-for-major-mode 'mu4e-view-mode "s" 'mu4e-save-attachments)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)))

(defun org-copy-idlink() "Copy an ID link with the
headline to killring, if no ID is there then create a new unique
ID.  This function works only in org-mode or org-agenda buffers. 
 
The purpose of this function is to easily construct id:-links to 
org-mode items. If its assigned to a key it saves you marking the
text and copying to the killring."
  (interactive)
  (when (eq major-mode 'org-agenda-mode) ;switch to orgmode
    (org-agenda-show)
    (org-agenda-goto))
  (when (eq major-mode 'org-mode) ; do this only in org-mode buffers
    (setq mytmphead (nth 4 (org-heading-components)))
    (setq mytmpid (funcall 'org-id-get-create))
    (setq mytmplink (format "[[id:%s][%s]]" mytmpid mytmphead))
    (kill-new mytmplink)
    (message "Copied %s to killring (clipboard)" mytmplink)
    ))

(spacemacs/set-leader-keys-for-major-mode 'org-mode "y" 'org-copy-idlink)

(setq org-super-agenda-groups
      '( (:auto-category t)      ))

(setq org-todo-keywords '((sequence "PROJ(p)" "TODO(t)" "WAITING(w)" "NEXT(n)" "|" "DONE(d)" "CANCELLED(c)" "DELEGATED(o)")))
