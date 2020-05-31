;;;     ,---,                                  ____
;;;   .'  .' `\                              ,'  , `.
;;; ,---.'     \    ,---.     ,---.       ,-+-,.' _ |
;;; |   |  .`\  |  '   ,'\   '   ,'\   ,-+-. ;   , ||
;;; :   : |  '  | /   /   | /   /   | ,--.'|'   |  ||
;;; |   ' '  ;  :.   ; ,. :.   ; ,. :|   |  ,', |  |,
;;; '   | ;  .  |'   | |: :'   | |: :|   | /  | |--'
;;; |   | :  |  ''   | .; :'   | .; :|   : |  | ,
;;; '   : | /  ; |   :    ||   :    ||   : |  |/
;;; |   | '` ,/   \   \  /  \   \  / |   | |`-'
;;; ;   :  .'      `----'    `----'  |   ;/
;;; |   ,.'                          '---'
;;; '---'

;; Identify myself for utilities that need it
(setq user-full-name "Russell Clarey"
      user-mail-address "r.e.clarey@gmail.com")

;; Set my font
(setq doom-font (font-spec :family "monospace" :size 14))

;; Get a nice theme
(setq doom-theme 'doom-nord)

;; Clean up the start screen
(defun doom-dashboard-widget-footer () nil)
(defun doom-dashboard-widget-banner ()
  (mapc (lambda (line)
          (insert (propertize (+doom-dashboard--center +doom-dashboard--width line)
                              'face 'doom-dashboard-banner) " ")
          (insert "\n"))
        '("██╗   ██╗ ██████╗ "
          "╚██╗ ██╔╝██╔═══██╗"
          " ╚████╔╝ ██║   ██║"
          "  ╚██╔╝  ██║   ██║"
          "   ██║   ╚██████╔╝"
          "   ╚═╝    ╚═════╝ ")))
(setq +doom-dashboard-menu-sections
  '(("Reload last session"
     :when (cond ((require 'persp-mode nil t)
                  (file-exists-p (expand-file-name persp-auto-save-fname persp-save-dir)))
                 ((require 'desktop nil t)
                  (file-exists-p (desktop-full-file-name))))
     :face (:inherit (doom-dashboard-menu-title bold))
     :action doom/quickload-session)
    ("Recently opened files"
     :action recentf-open-files)
    ("Open project"
     :action projectile-switch-project)))

;; A place for our org files
(setq org-directory "~/org/")

;; Line numbers are nice
(setq display-line-numbers-type t)

;; Drag stuff around
(define-key global-map (kbd "M-h") nil)
(define-key global-map (kbd "M-j") nil)
(define-key global-map (kbd "M-k") nil)
(define-key global-map (kbd "M-l") nil)
(define-key evil-visual-state-map (kbd "M-h") 'drag-stuff-left)
(define-key evil-visual-state-map (kbd "M-j") 'drag-stuff-down)
(define-key evil-visual-state-map (kbd "M-k") 'drag-stuff-up)
(define-key evil-visual-state-map (kbd "M-l") 'drag-stuff-right)

;; Repeat commands
(define-key global-map (kbd "C-,") 'repeat)

;; Make tramp always use out-of-band copy
(setq tramp-copy-size-limit nil)

;; Indenting for everyone
(setq
  css-indent-offset 2
  js-indent-level 2
  js2-basic-offset 2
  typescript-indent-level 2
  web-mode-attr-indent-offset 2
  web-mode-code-indent-offset 2
  web-mode-css-indent-offset 2
  web-mode-markup-indent-offset 2
)

(load! "lisp/deno-fmt.el")

;; deno-fmt on all the modes
(add-hook 'js2-mode-hook 'deno-fmt-mode)
(add-hook 'typescript-mode-hook 'deno-fmt-mode)
(add-hook 'web-mode-hook 'deno-fmt-mode)
(add-hook 'rjsx-mode-hook 'deno-fmt-mode)

;; Get linting working for typescript
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1)
  (flycheck-add-next-checker 'typescript-tide 'javascript-eslint)
)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; Get tide working for deno
(setq tide-tsserver-executable "/Users/russell/.config/nvm/12.16.2/bin/tsserver")

;; Make getting symbols easier
(define-key evil-motion-state-map (kbd "C-z") nil)
(define-key evil-insert-state-map (kbd "C-z") nil)
(define-key evil-motion-state-map (kbd "C-z <RET>") 'insert-char)
(define-key evil-insert-state-map (kbd "C-z <RET>") 'insert-char)
(define-key evil-motion-state-map (kbd "C-z [") (lambda () (interactive) (insert "⟦")))
(define-key evil-insert-state-map (kbd "C-z [") (lambda () (interactive) (insert "⟦")))
(define-key evil-motion-state-map (kbd "C-z ]") (lambda () (interactive) (insert "⟧")))
(define-key evil-insert-state-map (kbd "C-z ]") (lambda () (interactive) (insert "⟧")))
(define-key evil-motion-state-map (kbd "C-z l") (lambda () (interactive) (insert "λ")))
(define-key evil-insert-state-map (kbd "C-z l") (lambda () (interactive) (insert "λ")))
(define-key evil-motion-state-map (kbd "C-z b") (lambda () (interactive) (insert "β")))
(define-key evil-insert-state-map (kbd "C-z b") (lambda () (interactive) (insert "β")))
(define-key evil-motion-state-map (kbd "C-z h") (lambda () (interactive) (insert "η")))
(define-key evil-insert-state-map (kbd "C-z h") (lambda () (interactive) (insert "η")))
(define-key evil-motion-state-map (kbd "C-z .") (lambda () (interactive) (insert "→")))
(define-key evil-insert-state-map (kbd "C-z .") (lambda () (interactive) (insert "→")))
(define-key evil-motion-state-map (kbd "C-z >") (lambda () (interactive) (insert "⇒")))
(define-key evil-insert-state-map (kbd "C-z >") (lambda () (interactive) (insert "⇒")))
(define-key evil-motion-state-map (kbd "C-z <") (lambda () (interactive) (insert "⇐")))
(define-key evil-insert-state-map (kbd "C-z <") (lambda () (interactive) (insert "⇐")))
(define-key evil-motion-state-map (kbd "C-z u") (lambda () (interactive) (insert "∪")))
(define-key evil-insert-state-map (kbd "C-z u") (lambda () (interactive) (insert "∪")))
(define-key evil-motion-state-map (kbd "C-z a") (lambda () (interactive) (insert "α")))
(define-key evil-insert-state-map (kbd "C-z a") (lambda () (interactive) (insert "α")))
(define-key evil-motion-state-map (kbd "C-z e") (lambda () (interactive) (insert "ε")))
(define-key evil-insert-state-map (kbd "C-z e") (lambda () (interactive) (insert "ε")))
(define-key evil-motion-state-map (kbd "C-z E") (lambda () (interactive) (insert "∈")))
(define-key evil-insert-state-map (kbd "C-z E") (lambda () (interactive) (insert "∈")))
(define-key evil-motion-state-map (kbd "C-z s") (lambda () (interactive) (insert "Σ")))
(define-key evil-insert-state-map (kbd "C-z s") (lambda () (interactive) (insert "Σ")))
(define-key evil-motion-state-map (kbd "C-z d") (lambda () (interactive) (insert "δ")))
(define-key evil-insert-state-map (kbd "C-z d") (lambda () (interactive) (insert "δ")))
(define-key evil-motion-state-map (kbd "C-z g") (lambda () (interactive) (insert "ɣ")))
(define-key evil-insert-state-map (kbd "C-z g") (lambda () (interactive) (insert "ɣ")))
(define-key evil-motion-state-map (kbd "C-z x") (lambda () (interactive) (insert "⨯")))
(define-key evil-insert-state-map (kbd "C-z x") (lambda () (interactive) (insert "⨯")))
(define-key evil-motion-state-map (kbd "C-z |") (lambda () (interactive) (insert "｜")))
(define-key evil-insert-state-map (kbd "C-z |") (lambda () (interactive) (insert "｜")))
(define-key evil-motion-state-map (kbd "C-z -") (lambda () (interactive) (insert "⊢")))
(define-key evil-insert-state-map (kbd "C-z -") (lambda () (interactive) (insert "⊢")))
(define-key evil-motion-state-map (kbd "C-z A") (lambda () (interactive) (insert "\\begin{align*}\n\\end{align*}")))
(define-key evil-insert-state-map (kbd "C-z A") (lambda () (interactive) (insert "\\begin{align*}\n\\end{align*}")))

;; Setup linting for elisp packages
(eval-after-load 'flycheck
  '(flycheck-package-setup))
