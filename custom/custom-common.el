;;; custom-common.el --- 公共配置
;;; Commentary:
;;; Code:

(defconst *is-mac* (eq system-type 'darwin))
(defconst *is-linux* (eq system-type 'gnu/linux))
(defconst *is-windows* (or (eq system-type 'ms-dos)(eq system-type 'windows-nt)))

(provide 'custom-common)
;;; custom-common.el ends here
