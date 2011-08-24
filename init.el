(push "/usr/local/bin" exec-path)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path "~/.emacs.d/plugins/ecb-2.40")
(add-to-list 'load-path "/Users/patrikbjorklund/.emacs.d/plugins/rinari")
(add-to-list 'load-path "~/.emacs.d/plugins")

(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))
(el-get 'sync)
(setq my-packages
      (append
       '(el-get color-theme color-theme-railscasts auto-complete yasnippet)
       ))
(el-get 'sync my-packages)
;; Set up color-theme-theme
(color-theme-irblack)

;; Emacs behavior
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
(delete-selection-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode t)

;; Make CMD into M (for mac)
(setq mac-option-modifier 'none)
(setq mac-command-modifier 'meta)

;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)

;; Rinari
(require 'rinari)

; allows syntax highlighting to work
 (global-font-lock-mode 1)

;; Load CEDET.
;; This is required by ECB which will be loaded later.
;; See cedet/common/cedet.info for configuration details.
(load-file "~/.emacs.d/plugins/cedet/common/cedet.el")

;; Enable EDE (Project Management) features
(global-ede-mode 1)

;; * This enables the database and idle reparse engines
(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
(semantic-load-enable-code-helpers)

(load-file "~/.emacs.d/plugins/ecb-2.40/ecb.el")
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-source-path (quote ("~/Documents/Kod/rails/" "~/.emacs.d/")))
 '(ecb-tip-of-the-day nil)
 '(org-agenda-files (quote ("~/org/todo.org" "~/.emacs.d/init.el"))))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; Map enter key to newline-and-indent
(global-set-key "\C-m" 'newline-and-indent)

;;Rsense
(setq rsense-home "/opt/rsense-0.3")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

;; Rsense + Autocomplete
(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))

;; Rvm
(require 'rvm)
(rvm-use-default) ;; use rvm’s default ruby for the current Emacs session

;; Nxhtml
(load "~/.emacs.d/plugins/nxhtml/autostart.el")
(require 'mumamo-fun)
(setq
 nxhtml-global-minor-mode t
 mumamo-chunk-coloring 'submode-colored
 nxhtml-skip-welcome t
 indent-region-mode t
 rng-nxml-auto-validate-flag nil
 nxml-degraded t)

;; Rails-snippets
(require 'yasnippet)
(yas/initialize)
(yas/define-snippets 'nxhtml-mode nil 'html-mode)
(yas/load-directory "~/.emacs.d/plugins/yasnippets-rails/rails-snippets")

(add-to-list 'load-path "~/.emacs.d")    ; This may not be appeared if you have already added.
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/dict")
(require 'auto-complete-config)
(ac-config-default)

;; Org mode
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
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
(setq org-todo-keywords
       '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "PROJECT(p)" "DONE(d)")))
(setq org-agenda-include-diary t)         
(setq org-agenda-include-all-todo t)
