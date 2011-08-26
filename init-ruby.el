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

;; Rails-snippets
(require 'yasnippet)
(yas/initialize)
(yas/define-snippets 'nxhtml-mode nil 'html-mode)
(yas/load-directory "~/.emacs.d/plugins/yasnippets-rails/rails-snippets")

(add-hook 'ruby-mode-hook (lambda () (local-set-key "\r" 'newline-and-indent)))

(require 'rails-apidock)

(provide 'init-ruby)