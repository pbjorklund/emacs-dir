;; Rvm
(require 'rvm)
(rvm-use-default) ;; use rvm’s default ruby for the current Emacs session

;; Rails-snippets
(require 'yasnippet)
(yas/initialize)
(yas/define-snippets 'nxhtml-mode nil 'html-mode)
(yas/load-directory "~/.emacs.d/plugins/yasnippet-rails/rails-snippets")

(add-hook 'ruby-mode-hook (lambda () (local-set-key "\r" 'newline-and-indent)))
(provide 'init-ruby)

;; Inf-ruby
(add-to-list 'load-path "~/.emacs.d/plugins/inf-ruby")
(require 'inf-ruby)

;; Rinari
(add-to-list 'load-path "~/.emacs.d/plugins/rinari")
(require 'rinari)
