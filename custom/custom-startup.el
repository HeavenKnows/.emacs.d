;;; custom-startup.el --- 启动配置, 主要是包管理
;;; Commentary:
;;; Code:

(require 'package)
;; Setup package repositories
(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                         ("elpy" . "https://jorgenschaefer.github.io/packages/")))
;; Initialize package system but don't load all the packages
;; (package-initialize nil)
(unless (bound-and-true-p package--initialized) (package-initialize))
;; (setq package-enable-at-startup nil)
(unless package-archive-contents (package-refresh-contents))
;; Install use-package if necessary
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t
;;      use-package-always-defer t
      use-package-always-demand nil
      use-package-expand-minimally t
      use-package-verbose t)

(provide 'custom-startup)
;;; custom-startup.el ends here
