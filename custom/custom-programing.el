;;; custom-programing.el --- 编程配置
;;; Commentary:
;;; Code:

;; yasnippet
(use-package yasnippet
  :config
  (setq yas-snippet-dirs '("~/.yasnippet/snippets"))
  (yas-global-mode 1)
  (global-set-key (kbd "M-n") 'yas-insert-snippet)
  )

;; Projectile
(use-package projectile
  :init (projectile-mode +1)
  :config
  (setq projectile-completion-system 'helm)
  (setq projectile-switch-project-action 'helm-projectile)
  ;; :bind (:map projectile-mode-map
  ;;             ("s-p" . projectile-command-map)
  ;;             ("C-c p" . projectile-command-map))
  )

(use-package helm-projectile
  :config (helm-projectile-on)
  )

;; Company
(use-package company
  :hook (prog-mode . company-mode)
  )

;; Flycheck
(use-package flycheck
  :hook (prog-mode . flycheck-mode)
  )

;; Indentation
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(global-set-key (kbd "RET") 'newline-and-indent)

(use-package lsp-mode
  :hook (
         ((;; 使用clangd
           c-mode
           c++-mode
           ;; 可以直接M-x lsp-install-server, 选lua-language-server,
           ;; 最后会安装在.emacs.d/.cache/lsp/下
           lua-mode
           ;; 使用gopls
           go-mode) . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration)
         )
  :commands (lsp lsp-deferred)
  :bind ("M-," . lsp-find-references)
  :config
  (setq lsp-auto-guess-root t)
  (setq lsp-headerline-breadcrumb-enable nil) ;; 把最上方显示的文件路径关了
  )

;; 提供peek等功能, 暂时不需要
(use-package lsp-ui
  :commands lsp-ui-mode
  )

(use-package helm-lsp
  :commands helm-lsp-workspace-symbol
  )

(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list
  )

;; 代码跳转后用来前进后退
(use-package backward-forward
  :demand
  :config (backward-forward-mode t)
  :bind (:map backward-forward-mode-map
         ("<C-left>" . nil)
         ("<C-right>" . nil)
         ("<M-left>" . backward-forward-previous-location)
         ("<M-right>" . backward-forward-next-location)
         )
  )

(provide 'custom-programing)
;;; custom-programing.el ends here
