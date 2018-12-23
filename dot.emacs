
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

(setq gofmt-command "~/go/bin/goimports")
;;(require 'go-mode-autoloads)
(add-hook 'before-save-hook 'gofmt-before-save)

(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "M-.") 'other-window)

(defun mts-set-go-keys ()
    (local-set-key (kbd "C-c C-c") 'comment-region))

(add-hook 'go-mode-hook 'mts-set-go-keys)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq make-backup-files nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(inverse-video t)
 '(package-selected-packages (quote (go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
