(push "/usr/local/bin" exec-path)

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/plugins/rinari")

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

(require 'init-customizations)

;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)

;; Rinari
(require 'rinari)

;; (require 'init-cedet-ecb)

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
(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . eruby-html-mumamo))
(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-html-mumamo))

;; Rails-snippets
(require 'yasnippet)
(yas/initialize)
(yas/define-snippets 'nxhtml-mode nil 'html-mode)
(yas/load-directory "~/.emacs.d/plugins/yasnippets-rails/rails-snippets")

(add-to-list 'load-path "~/.emacs.d")    ; This may not be appeared if you have already added.
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/dict")
(require 'auto-complete-config)
(ac-config-default)


(require 'init-org-mode)

;; Keybindings
(global-set-key [f4] 'ecb-goto-window-directories)
(global-set-key [f5] 'ecb-goto-window-sources)
(global-set-key [f6] 'ecb-goto-window-methods)
(global-set-key [f7] 'ecb-goto-window-edit1)

;; Ido-goto-symbol
 (defun ido-goto-symbol (&optional symbol-list)
      "Refresh imenu and jump to a place in the buffer using Ido."
      (interactive)
      (unless (featurep 'imenu)
        (require 'imenu nil t))
      (cond
       ((not symbol-list)
        (let ((ido-mode ido-mode)
              (ido-enable-flex-matching
               (if (boundp 'ido-enable-flex-matching)
                   ido-enable-flex-matching t))
              name-and-pos symbol-names position)
          (unless ido-mode
            (ido-mode 1)
            (setq ido-enable-flex-matching t))
          (while (progn
                   (imenu--cleanup)
                   (setq imenu--index-alist nil)
                   (ido-goto-symbol (imenu--make-index-alist))
                   (setq selected-symbol
                         (ido-completing-read "Symbol? " symbol-names))
                   (string= (car imenu--rescan-item) selected-symbol)))
          (unless (and (boundp 'mark-active) mark-active)
            (push-mark nil t nil))
          (setq position (cdr (assoc selected-symbol name-and-pos)))
          (cond
           ((overlayp position)
            (goto-char (overlay-start position)))
           (t
            (goto-char position)))))
       ((listp symbol-list)
        (dolist (symbol symbol-list)
          (let (name position)
            (cond
             ((and (listp symbol) (imenu--subalist-p symbol))
              (ido-goto-symbol symbol))
             ((listp symbol)
              (setq name (car symbol))
              (setq position (cdr symbol)))
             ((stringp symbol)
              (setq name symbol)
              (setq position
                    (get-text-property 1 'org-imenu-marker symbol))))
            (unless (or (null position) (null name)
                        (string= (car imenu--rescan-item) name))
              (add-to-list 'symbol-names name)
              (add-to-list 'name-and-pos (cons name position))))))))
    (global-set-key (kbd "M-i") 'ido-goto-symbol) ; or any key you see fit
