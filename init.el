(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(push "/usr/local/bin" exec-path)
(add-to-list 'load-path "~/.emacs.d/plugins/ecb-2.40")
(add-to-list 'load-path "~/.emacs.d/plugins")

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
(add-to-list 'load-path "/Users/patrikbjorklund/.emacs.d/plugins/rinari")
(require 'rinari)

;; Ruby-electric
;;(require 'ruby-electric)
;;(add-hook 'ruby-mode-hook 'ruby-electric-mode)

;; MuMaMo-Mode for rhtml files
(add-to-list 'load-path "~/.emacs.d/plugins/nxhtml/util/")
(require 'mumamo-fun)
(setq mumamo-chunk-coloring 5)
(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . eruby-html-mumamo))
(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-html-mumamo))

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
 '(ecb-layout-window-sizes (quote (("left3" (0.15648854961832062 . 0.29411764705882354) (0.15648854961832062 . 0.3382352941176471) (0.15648854961832062 . 0.35294117647058826)))))
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-source-path (quote ("~/Documents/Kod/rails/" "~/.emacs.d/")))
 '(ecb-tip-of-the-day nil))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(add-hook 'ruby-mode-hook
      (lambda()
        (add-hook 'local-write-file-hooks
                  '(lambda()
                     (save-excursion
                       (untabify (point-min) (point-max))
                       (delete-trailing-whitespace)
                       )))
        (set (make-local-variable 'indent-tabs-mode) 'nil)
        (set (make-local-variable 'tab-width) 2)
        (imenu-add-to-menubar "IMENU")
        (define-key ruby-mode-map "\C-m" 'newline-and-indent) ;Not sure if this line is 100% right!
     ;   (require 'ruby-electric)
     ;   (ruby-electric-mode t)
        ))

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

;; Rails-snippets
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippets-rails/rails-snippets")

(ecb-activate)