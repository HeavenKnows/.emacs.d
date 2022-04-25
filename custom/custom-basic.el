;;; custom-basic.el --- 基础配置
;;; Commentary:
;;; Code:

;; mac改键
;; (require 'custom-common)
;; (when *is-mac*
;;   (setq mac-command-modifier 'meta)    ;; cmd  -> meta,  M-
;;   (setq mac-option-modifier 'super)    ;; opt  -> super, s-
;;   (setq mac-control-modifier 'control) ;; ctrl -> ctrl,  C-
;;   (setq ns-function-modifier 'hyper))  ;; fn   -> hyper, H-

;; 显示相关
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(blink-cursor-mode -1)
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))

;; 行号
(use-package emacs
  :config
  (global-display-line-numbers-mode t))

;; UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(setq current-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(setenv "LC_CTYPE" "UTF-8")

;; Backup file settings
(setq
 ;;backup-by-coping t
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)
;; Save directory
(push (cons "." "~/.saves") backup-directory-alist)

;; Custom file, 用于保存通过UI设置的配置
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file) (load-file custom-file))

;; Helm
;; TODO 待整理, 应该不需要这么多自定义的配置
(use-package helm
  :ensure t
  :config
  (require 'helm)
  (require 'helm-config)
  ;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
  ;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
  ;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))
  ;; rebind tab to run persistent action
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  ;; make TAB work in terminal
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
  ;; list actions using C-z
  (define-key helm-map (kbd "C-z") 'helm-select-action)
  ;; Enable Helm for vairous scenarios
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  ;; Enable fuzzy matching
  ;;(setq
   ;;helm-M-x-fuzzy-match t
   ;;helm-semantic-fuzzy-match t
   ;;helm-imenu-fuzzy-match t
   ;;helm-buffers-fuzzy-matching t
   ;;helm-recentf-fuzzy-match t)
  (setq
   ;; open helm buffer inside current window, not occupy whole other window
   ;;helm-split-window-in-side-p t
   ;; move to end or beginning of source when reaching top or bottom of source
   helm-move-to-line-cycle-in-source t
   ;;search for library in `require' and `declare-function' sexp
   ;;helm-ff-search-library-in-sexp t
   ;; scroll 20 lines other window using M-<next>/M-<prior>
   helm-scroll-amount 20
   ;;helm-ff-file-name-history-use-recentf t
   helm-echo-input-in-header-line t)
  (setq helm-autoresize-max-height 0)
  (setq helm-autoresize-min-height 50)
  (helm-autoresize-mode 1)
  (helm-mode 1)
  )

;; 用来提示快捷键
(use-package which-key
  :defer nil
  :config (which-key-mode)
  )

;; buffer移动
(use-package buffer-move
  :bind (
         ("S-<left>" . buf-move-left)
         ("S-<right>" . buf-move-right)
         ("S-<up>" . buf-move-up)
         ("S-<down>" . buf-move-down)
         )
  )

;; 窗口跳转
(global-set-key (kbd "C-M-<left>") 'windmove-left)
(global-set-key (kbd "C-M-<right>") 'windmove-right)
(global-set-key (kbd "C-M-<up>") 'windmove-up)
(global-set-key (kbd "C-M-<down>") 'windmove-down)

;; 调整窗口大小
;; (use-package resize-window) ;; 或windresize
;; TODO 这套有点反直觉的问题: 上下左右应该是移动边界
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; 窗口切分
(global-set-key (kbd "C-x -") 'split-window-vertically)
(global-set-key (kbd "C-x |") 'split-window-horizontally)

;; 关闭窗口
(global-set-key (kbd "C-x x") 'delete-window)

(provide 'custom-basic)
;;; custom-basic.el ends here
