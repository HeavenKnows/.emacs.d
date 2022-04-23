;;; custom-tools.el --- 工具配置
;;; Commentary:
;;; Code:

;; 用来测启动时间, M-x benchmark...
(use-package benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/deactivate))

;; org-mode支持导出markdown
(require 'ox-md nil t)

;; org-mode中文换行
(add-hook 'org-mode-hook
          (lambda () (setq truncate-lines nil)))

(provide 'custom-tools)
;;; custom-tools.el ends here
