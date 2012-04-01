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

(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

(provide 'init-customizations)

;; Use Emacs terminfo, not system terminfo
(setq system-uses-terminfo nil)
