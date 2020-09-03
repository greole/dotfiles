(provide 'mu4e-config)
;; Set up some common mu4e variables

(setq mu4e-maildir "~/.mail/hpsim"
      mu4e-trash-folder "/Trash"
      mu4e-refile-folder "/Archive"
      mu4e-sent-folder "/Sent"
      mu4e-drafts-folder "/Drafts"
      mu4e-get-mail-command ""
      mu4e-update-interval 300
      mu4e-view-show-images t
      mu4e-view-show-addresses t
      mu4e-reply-to-address "Gregor Olenik <go@hpsim.de>"
      mu4e-compose-signature "PGP ID 5059A3139507ADB7"
      browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "qutebrowser"
      user-mail-address "go@hpsim.de"
      user-full-name  "Gregor Olenik"
      )

;; Mail directory shortcuts
(setq mu4e-maildir-shortcuts
      '(
        ("/INBOX" . ?i)
        ("/Sent"  . ?s)
        ("/Archive"  . ?a)
        ))


(setq mu4e-use-fancy-chars nil)
(setq mu4e-headers-show-threads nil)
(setq mu4e-headers-include-related nil)

;; Restrict mu4e to  80 chars
(setq  mu4e-headers-fields '(
    (:flags         .    6)
    (:from          .   20)
    (:subject       .   42)
    (:human-date    .   12)
    ))

;; Fwd generates lots of duplicate mails
;; After deleting one mail the duplicate
;; is shown
(setq mu4e-headers-skip-duplicates nil)

(setq mu4e-headers-visible-columns 85)

;; Why would I want to leave my message open after I've sent it?
(setq message-kill-buffer-on-exit t)

;; Don't ask to quit... why is this the default?
(setq mu4e-confirm-quit nil)

(setq mu4e-split-view 'vertical)


;; Save all attachments of a mail
(defvar bulk-saved-attachments-dir (expand-file-name "~/tmp/mu4e"))

(defun cleanse-subject (sub)
  (replace-regexp-in-string
   "[^A-Z0-9]+"
   "-"
   (downcase sub)))

(defun mu4e-save-attachments (&optional msg)
  "Saves all of the attachments in `msg' to a directory under
`bulk-saved-attachments-dir' which is derived from the subject
beloning to `msg'. Existing filenames will be overwritten without
prompt. The directories are not cleaned up in any way."
  (interactive)
  (let* ((msg (or msg (mu4e-message-at-point)))
         (id (cleanse-subject (mu4e-message-field msg :subject)))
         (attachdir (concat bulk-saved-attachments-dir "/" id))
         (count (hash-table-count mu4e~view-attach-map)))
    (if (> count 0)
        (progn
          (mkdir attachdir t)
          (dolist (num (number-sequence 1 count))
            (let* ((att (mu4e~view-get-attach msg num))
                   (fname (plist-get att :name))
                   (index (plist-get att :index))
                   fpath)
              (setq fpath (concat attachdir "/" fname))
              (mu4e~proc-extract
               'save (mu4e-message-field msg :docid)
               index mu4e-decryption-policy fpath)))
          (ranger attachdir)
          (revert-buffer))
      (message "Nothing to extract."))))

;; smtp
(setq message-send-mail-function 'message-send-mail-with-sendmail)
(setq sendmail-program "/usr/bin/msmtp")
;; tell msmtp to choose the SMTP server according to the from field in the outgoing email
(setq message-sendmail-extra-arguments '("--read-envelope-from"))
(setq message-sendmail-f-is-evil 't)

