;;; init.el --- Chris's Emacs Config
;;; Commentary:
;;; Code:

;; 设置配置加载路径
(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "custom")))

(require 'custom-startup)    ;; 启动配置, 如包管理
(require 'custom-basic)      ;; 基础配置, 如utf-8,
(require 'custom-programing) ;; 编程配置, 如跳转, 补全, 语法检查
(require 'custom-languages)  ;; 语言配置, 如C++, Lua, Golang, Python...
(require 'custom-tools)      ;; 一些工具

;; 主题
(load-theme 'spacemacs-dark t)

;;; init.el ends here
