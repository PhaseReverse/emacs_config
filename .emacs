;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("5a611788d47c1deec31494eb2bb864fde402b32b139fe461312589a9f28835db" "4a288765be220b99defaaeb4c915ed783a9916e3e08f33278bf5ff56e49cbc73" "78e6be576f4a526d212d5f9a8798e5706990216e9be10174e3f3b015b8662e27" "3263bd17a7299449e6ffe118f0a14b92373763c4ccb140f4a30c182a85516d7f" "34be6a46f3026dbc0eed3ac8ccf60cba5d2a6ad71aa37ccf21fbd6859f9b4d25" "b77a00d5be78f21e46c80ce450e5821bdc4368abf4ffe2b77c5a66de1b648f10" "57a29645c35ae5ce1660d5987d3da5869b048477a7801ce7ab57bfb25ce12d3e" "833ddce3314a4e28411edf3c6efde468f6f2616fc31e17a62587d6a9255f4633" "c7000071e9302bee62fbe0072d53063da398887115ac27470d664f9859cdd41d" default))
 '(package-selected-packages
   '(emms dart-mode lsp-mode lsp-dart lsp-treemacs flycheck company lsp-ui company hover))
 '(subatomic-high-contrast t))
;; exwm)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;;(package-initialize)

;; (require 'package)
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-archives
;;    (quote
;;     (("gnu" . "https://elpa.gnu.org/packages/")
;;      ("melpa" . "https://melpa.org/packages/")))))
;; (package-initialize)


;;;;display battery and time in modeline

;;(display-battery-mode)
;;(display-time-mode)

;;remove menubar, toolbar

(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/")
(require 'eaf)
(require 'eaf-browser)
(require 'eaf-pdf-viewer)
(require 'eaf-music-player)
(require 'eaf-terminal)
(require 'eaf-video-player)
(require 'eaf-file-manager)
(require 'eaf-file-browser)
;;(require 'eaf-rss-reader)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;;;exwm initialization

;;(require 'exwm)
;;(require 'exwm-config)
;;(exwm-config-exampleene)


;;dark mode

;;(invert-face 'default)


;;rust-mode

(require 'rust-mode)

;;;;Audio Volume Keybindings

(global-set-key (kbd "<XF86AudioLowerVolume>")
		(lambda()
		  (interactive)
		  (with-temp-buffer
		    (insert (shell-command "amixer  sset Master 5%-" t))
		    (search-forward "[")
		    (let ((start (point))
			 (end nil)
			 )
		      (search-forward "]")
		      (setq end (point))
		    (message "Volume %s" (buffer-substring-no-properties start (- end 1)))
		    ))))

(global-set-key (kbd "<XF86AudioRaiseVolume>")
		(lambda()
		  (interactive)
		  (with-temp-buffer
		    (insert (shell-command "amixer  sset Master 5%+" t))
		    (search-forward "[")
		    (let ((start (point))
			 (end nil)
			 )
		      (search-forward "]")
		      (setq end (point))
		    (message "Volume %s" (buffer-substring-no-properties start (- end 1)))
		    ))))


;;;;eDP-1 monitor brightness keybindings

(global-set-key (kbd "<XF86MonBrightnessDown>")
		(lambda()
		  (interactive)
		  (with-temp-buffer
		    (insert (shell-command "brightnessctl s 5%-" t))
		    (search-forward "(")
		    (let ((start (point))
			 (end nil)
			 )
		      (search-forward ")")
		      (setq end (point))
		    (message "Brightness %s" (buffer-substring-no-properties start (- end 1)))
		    ))))

(global-set-key (kbd "<XF86MonBrightnessUp>")
		(lambda()
		  (interactive)
		  (with-temp-buffer
		    (insert (shell-command "brightnessctl s 5%+" t))
		    (search-forward "(")
		    (let ((start (point))
			 (end nil)
			 )
		      (search-forward ")")
		      (setq end (point))
		    (message "Brightness %s" (buffer-substring-no-properties start (- end 1)))
		    ))))

;; (setq erc-server "";
;;       erc-user-full-name "";
;;       erc-nick "";
;;       erc-password ""
;;       )


(define-skeleton c-throwaway
  "Throwaway C skeleton"
  nil
  "#include <stdio.h>\n"
  "#include <stdlib.h>\n"
  "\n"
  "int main(void){\n"
  "\n"
  "  int t;\n"
  "  scanf(\"%d\",&t);\n"
  "  while(t--){\n"
  "\n"
  "  }\n"
  "  return 0;\n"
  "}\n")
(define-skeleton cpp-throwaway
  "C++ skeleton"
  nil
  "#include <bits/stdc++.h>\n"
  "using namespace std;\n"
  "\n"
  "int main(){\n"
  "  ios::sync_with_stdio(0); cin.tie(0); cout.tie(0);\n"
  "\n"
  "  int t;\n"
  "  cin >> t;\n"
  "  while(t--){\n"
  "\n"
  "  }\n"
  "  return 0;\n"
  "}\n")
(define-skeleton rust-throwaway
  "Rust skeleton"
  nil
  "fn main(){\n"
  "\n"
  "}\n"
  )

(define-auto-insert "\\.\\(c\\)\\'" 'c-throwaway)
(define-auto-insert "\\.\\(cpp\\)\\'" 'cpp-throwaway)
(define-auto-insert "\\.\\(rs\\)\\'" 'rust-throwaway)
(auto-insert-mode)




;;(linum-mode 1)
(global-display-line-numbers-mode)
;;(load-theme 'subatomic)
;;(load-theme 'monokai)
;;(load-theme 'solarized-light t)
(load-theme 'modus-vivendi)

(global-set-key (kbd "C-x p") (lambda () (interactive) (other-window -1)))

(global-set-key (kbd "C-x M-b") 'eaf-open-browser)
(eaf-setq eaf-browser-enable-adblocker "true")

(display-battery-mode t)
(setq display-time-day-and-date t)
(display-time)
(setq display-time-mail-string "")

(defun google-search (phrase)
  "Search Google for PHRASE in eaf-browser"
  (interactive "sSearch Google: ")
  (eaf-open-browser (concat "https://www.google.com/search?q=" phrase)))

(global-set-key (kbd "C-x M-g") 'google-search)

(defun duckduckgo-search (phrase)
  "Search duckduckgo for PHRASE in eaf-browser"
  (interactive "sSearch Duckduckgo: ")
(eaf-open-browser (concat "https://duckduckgo.com/?q=" phrase)))

(global-set-key (kbd "C-x M-d") 'duckduckgo-search)

(defun youtube-search (phrase)
  "Search Youtube for PHRASE in eaf-browser"
  (interactive "sSearch Youtube: ")
  (eaf-open-browser (concat "https://www.youtube.com/results?search_query=" phrase)))

(global-set-key (kbd "C-x M-y") 'youtube-search)


(defun yandex-search (phrase)
  "Search Yandex for PHRASE in eaf-browser"
  (interactive "sSearch Yandex: ")
  (eaf-open-browser (concat "https://yandex.com/search/?text=" phrase)))

(global-set-key (kbd "C-x M-r") 'yandex-search)



;;Read man pages
(global-set-key (kbd "C-x M-m") 'manual-entry)

;;eaf-terminal
(global-set-key (kbd "C-x M-t") 'eaf-open-terminal)




(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(setq package-selected-packages 
  '(dart-mode lsp-mode lsp-dart lsp-treemacs flycheck company
    ;; Optional packages
    lsp-ui company hover))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

(add-hook 'dart-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      company-minimum-prefix-length 1
      lsp-lens-enable t
      lsp-signature-auto-activate nil)




(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(require 'yasnippet)
(yas-global-mode  1)


(defun my:ac-c-headers-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)

  (add-to-list 'achead:include-directories '"/usr/include/c++/10")
  (add-to-list 'achead:include-directories '"/usr/include/x86_64-linux-gnu/c++/10")
  (add-to-list 'achead:include-directories '"/usr/include/c++/10/backward")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/10/include")
  (add-to-list 'achead:include-directories '"/usr/local/include")
  (add-to-list 'achead:include-directories '"/usr/include/x86_64-linux-gnu")
  (add-to-list 'achead:include-directories '"/usr/include"))

(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode-hook 'my:ac-c-headers-init)
(require 'iedit)

(global-flycheck-mode)

;;(require 'exwm)
;; (require 'exwm-config)
;; (exwm-config-default)

;;Set the default browser for org-mode
;;(setq browse-url-browser 'eaf-open)

;; (require 'exwm)
;; (require 'exwm-config)
;; (exwm-config-default)

(require 'emms-setup)
(emms-all)
(emms-default-players)
