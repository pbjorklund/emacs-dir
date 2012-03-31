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

;; You know, like Readline.
(global-set-key (kbd "C-M-h") 'backward-kill-word)

; allows syntax highlighting to work
(global-font-lock-mode 1)

;; Map enter key to newline-and-indent
(global-set-key "\C-m" 'newline-and-indent)
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Map zencoding key
(global-set-key (kbd "C-c C-z") 'zencoding-expand-line)

(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

(provide 'init-customizations)
