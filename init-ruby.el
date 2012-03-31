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
