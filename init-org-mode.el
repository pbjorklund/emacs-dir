;; Org mode
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-log-done t)

(defun todo ()
   (interactive)
   (find-file "~/org/todo.org")
 )

(setq org-remember-templates
          '(("Tasks" ?t "* TODO %?\n  %i\n  %a" "~/org/todo.org")
            ("Appointments" ?a "* Appointment: %?\n%^T\n%i\n  %a" "~/org/todo.org")))
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(eval-after-load 'remember
  '(add-hook 'remember-mode-hook 'org-remember-apply-template))
(global-set-key (kbd "C-c r") 'remember)

(setq org-directory "~/org")
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-agenda-files (quote ("~/org/todo.org")))
(setq org-mobile-inbox-for-pull "~/org/index.org")

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c t") 'todo)
(define-key global-map "\C-cl" 'org-store-link)

(setq org-todo-keywords
       '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "PROJECT(p)" "DONE(d)")))
(setq org-agenda-include-diary t)

(setf org-todo-keyword-faces '(("TODO" . (:foreground "moccasin" :bold t :weight bold))
			       ("STARTED"                . (:foreground "cyan" :bold t :weight bold))
			       ("WAITING"                . (:foreground "white" :bold t :weight bold))
             ("PROJECT"                . (:foreground "indian red" :bold t :weight bold))
			       ("DONE"                   . (:foreground "green" :bold t :weight bold))))

(provide 'init-org-mode)