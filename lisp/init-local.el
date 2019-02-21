;; init-local
;; avoid eamcs bug complain about too samll split window
(defun split-window-right-ignore (&optional size)
  (if (car size) size (list (/ (window-total-width) 2))))
(advice-add 'split-window-right :filter-args
            'split-window-right-ignore)

;; Offset the number by two spaces to work around some weird fringe glitch
;; (global-linum-mode t)
;(setq linum-format "  %-d")
(global-display-line-numbers-mode)

;; won't use fill column, seems not work
(global-unset-key (kbd "C-c f"))
;(global-set-key (kbd "C-c f") 'counsel-find-file)

;; this is not working
(eval-after-load 'c-mode '(define-key c++-mode-map (kbd "C-c C-c") nil))
(eval-after-load 'c++-mode '(define-key c++-mode-map (kbd "C-c C-c") nil))
(autoload 'c-mode "c-mode" "c-mode" t)

;; new copy & paste
(global-set-key (kbd "C-c C-v") 'whole-line-or-region-kill-ring-save)
;; won't use C-b move, but as paste
(global-unset-key (kbd "C-b"))
(global-set-key (kbd "C-b") 'whole-line-or-region-yank)

;; rename buffer short
(defun my-rename-buffer (newname)
  (interactive "sNew Name: ")
  (rename-buffer newname))
(global-unset-key (kbd "M-b"))
(global-set-key (kbd "M-b") 'my-rename-buffer)

;; ctrl + o : open file
(global-unset-key (kbd "C-o"))
(global-set-key (kbd "C-o") 'spacemacs/helm-find-files)

;; copy between apps
(setq x-select-enable-clipboard t)
;; json formater
(global-set-key (kbd "C-j") 'json-reformat-region)

;;(defun goto-match-paren (arg)
;;  "Go to the matching parenthesis if on parenthesis, otherwise insert %.
;;vi style of % jumping to matching brace."
;;  (interactive "p")
;;  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
;;        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
;;        (t (self-insert-command (or arg 1)))))

;; 
(defun eshell-clear-buffer ()
  "Clear terminal"
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))

(add-hook 'eshell-mode-hook
          '(lambda()
             (local-set-key (kbd "C-l") 'eshell-clear-buffer)))

(provide 'init-local)
