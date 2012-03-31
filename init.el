(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/plugins/rinari")

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
(add-to-list 'auto-mode-alist '("\\.js\\.erb\\'" . eruby-javascript-mumamo))
(add-to-list 'auto-mode-alist '("\\.js\\.rjs\\'" . eruby-javascript-mumamo))

;; Auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins//ac-dict")
(ac-config-default)
(require 'auto-complete-ruby)

;; yasnippet
(add-to-list 'load-path "~/.emacs.d/plugins")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")

;; Read files that init other modules
(require 'init-customizations)
(require 'init-ido)
(require 'init-ruby)
(require 'init-org-mode)
