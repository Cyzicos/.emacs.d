;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(add-hook 'after-init-hook 'global-company-mode)

(when (not package-archive-contents)
  (package-refresh-contents)
  )

(defvar myPackages
  '(better-defaults
    material-theme
    magit
    json-mode
    eglot
    company))

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally
(global-set-key (kbd "C-x g") 'magit-status)
(ido-mode 1)
(electric-indent-mode 0)
(setq x-select-enable-clipboard t)


(defun format_on_save ()
  ;; Format on save
  (when (eq major-mode 'python-mode)
    (eglot-format)
)
)

(add-hook 'before-save-hook #'format_on_save)




;; ;; PYTHON CONFIGURATION
;; ;; --------------------------------------
(add-hook 'python-mode-hook 'eglot-ensure)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (company eglot))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
