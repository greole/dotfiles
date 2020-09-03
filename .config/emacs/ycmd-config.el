(provide 'ycmd-config)

(flycheck-ycmd-setup)
(setq ycmd-server-command '("python" "/home/go/data/code/ycmd/ycmd"))
(setq ycmd-force-semantic-completion t)

(setq-default dotspacemacs-configuration-layers '(
        (auto-completion :variables
                          auto-completion-return-key-behavior 'complete
                          auto-completion-tab-key-behavior 'cycle
                          auto-completion-complete-with-key-sequence nil
                          auto-completion-complete-with-key-sequence-delay 0.1
                          auto-completion-private-snippets-directory nil)
        ))

(spacemacs/set-leader-keys  "."  'ycmd-goto)
