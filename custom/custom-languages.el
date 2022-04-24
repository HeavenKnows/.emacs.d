;;; custom-languages.el --- 语言配置
;;; Commentary:
;;; Code:

;; CC mode
(setq-default c-basic-offset 4)
(defun my-c-setup ()
  (c-set-offset 'innamespace [0]))
(add-hook 'c++-mode-hook 'my-c-setup)

;; 前端eglot,后端clangd
;; (use-package eglot
;;   :ensure t
;;   :config
;;   (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
;;   (add-hook 'c-mode-hook 'eglot-ensure)
;;   (add-hook 'c++-mode-hook 'eglot-ensure)
;;   (global-set-key (kbd "M-,") 'xref-find-references)
;;   (global-set-key (kbd "C-c r [") 'xref-pop-marker-stack)
;;   ;; 关闭eldoc
;;   '(eglot-ignored-server-capabilites '(:hoverProvider))
;;   ;;(setq xref-show-xrefs-function 'helm-xref-show-xrefs-27)
;;   )

;; Go配置
(use-package go-mode)
;; https://github.com/golang/tools/blob/master/gopls/doc/emacs.md
;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; Lua配置
(use-package lua-mode)

;; Protobuf
(use-package protobuf-mode)

(provide 'custom-languages)
;;; custom-languages.el ends here
