;;; ロードパスの追加
(setq load-path (append
                 '("~/.emacs.d")
;;                 '("~/.emacs.d/auto-install")
                 '("~/.emacs.d/el-get")
                 '("~/.emacs.d/elpa")
		 '("~/.emacs.d/elisp")
                 load-path))
;; Localeに合わせた環境の設定
(set-locale-environment nil)
;; C-hでバックスペース
;; 2012-03-18
(keyboard-translate ?\C-h ?\C-?)
;; 基本
(define-key global-map (kbd "M-?") 'help-for-help)        ; ヘルプ
(define-key global-map (kbd "C-z") 'undo)                 ; undo
(define-key global-map (kbd "C-c i") 'indent-region)      ; インデント
(define-key global-map (kbd "C-c C-i") 'hippie-expand)    ; 補完
(define-key global-map (kbd "C-c ;") 'comment-dwim)       ; コメントアウト
(define-key global-map (kbd "M-C-g") 'grep)               ; grep
(define-key global-map (kbd "C-[ M-C-g") 'goto-line)      ; 指定行へ移動
(define-key global-map (kbd "C-c #") 'hs-toggle-hiding)     ; 折りたたみトグル
;; ウィンドウ移動
;; 2011-02-17
;; 次のウィンドウへ移動
(define-key global-map (kbd "C-M-n") 'next-multiframe-window)
;; 前のウィンドウへ移動
(define-key global-map (kbd "C-M-p") 'previous-multiframe-window)
;; 再帰的にgrep
;; 2011-02-18
(require 'grep)
(setq grep-command-before-query "grep -nH -r -e ")
(defun grep-default-command ()
  (if current-prefix-arg
      (let ((grep-command-before-target
             (concat grep-command-before-query
                     (shell-quote-argument (grep-tag-default)))))
        (cons (if buffer-file-name
                  (concat grep-command-before-target
                          " *."
                          (file-name-extension buffer-file-name))
                (concat grep-command-before-target " ."))
              (+ (length grep-command-before-target) 1)))
    (car grep-command)))
(setq grep-command (cons (concat grep-command-before-query " .")
                         (+ (length grep-command-before-query) 1)))
(auto-image-file-mode t)           ; 画像ファイルを表示
;(menu-bar-mode -1)                ; メニューバーを消す
;(tool-bar-mode -1)                ; ツールバーを消す
(blink-cursor-mode 1)              ; カーソルの点滅をする
(setq eval-expression-print-length nil) ; evalした結果を全部表示
(show-paren-mode 1)                ; 対応する括弧を光らせる。
(setq show-paren-style 'mixed)     ; ウィンドウ内に収まらないときだけ括弧内も光らせる。
;; 空白や長すぎる行を視覚化する。
(require 'whitespace)
(setq whitespace-line-column 80)           ; 1行が80桁を超えたら長すぎると判断する。
(setq whitespace-style '(face              ; faceを使って視覚化する。
                         trailing          ; 行末の空白を対象とする。
                         lines-tail        ; 長すぎる行のうち
                                           ; whitespace-line-column以降のみを
                                           ; 対象とする。
                         space-before-tab  ; タブの前にあるスペースを対象とする。
                         space-after-tab)) ; タブの後にあるスペースを対象とする。
(global-whitespace-mode 0)          ; デフォルトで視覚化を有効にする。
(global-hl-line-mode)               ; 現在行を目立たせる
(column-number-mode t)              ; カーソルの位置が何文字目かを表示する
(line-number-mode t)                ; カーソルの位置が何行目かを表示する
(require 'saveplace)                ; カーソルの場所を保存する
(setq-default save-place t)
(setq kill-whole-line t)            ; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq require-final-newline t)      ; 最終行に必ず一行挿入する
(setq next-line-add-newlines nil)   ; バッファの最後でnewlineで新規行を追加するのを禁止する
;;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
;;; 部分一致の補完機能を使う
;;; p-bでprint-bufferとか
;(partial-completion-mode t) ;not works?
(icomplete-mode 1)               ;;; 補完可能なものを随時表示
(setq history-length 100000)     ;;; 履歴数を大きくする
(savehist-mode 1)                ;;; ミニバッファの履歴を保存する
(setq recentf-max-saved-items 10000)    ;;; 最近開いたファイルを保存する数を増やす
(auto-compression-mode t)    ;;; gzファイルも編集できるようにする
(setq ediff-window-setup-function 'ediff-setup-windows-plain) ;;; ediffを1ウィンドウで実行
(setq diff-switches '("-u" "-p" "-N"))    ;;; diffのオプション
(require 'dired-x) ;;; diredを便利にする
;;; diredから"r"でファイル名をインライン編集する
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
;;; ファイル名が重複していたらディレクトリ名を追加する。
;;(require 'uniquify)
;;(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; 2011-03-09
(setq-default flyspell-mode t)
(setq ispell-dictionary "american")

;; インストールされていたら有効にする。
(require 'migemo nil t)

;;http://d.hatena.ne.jp/beiz23/20090603/1244034052
;;(defface my-face-r-1 '((t (:background "gray15"))) nil)
(defface my-face-b-1 '((t (:background "gray"))) nil :group 'ShowSpace)
(defface my-face-b-2 '((t (:foreground "gray30" :underline t))) nil :group 'ShowSpace)
(defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil :group 'ShowSpace)
;;(defvar my-face-r-1 'my-face-r-1)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)

(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("\t" 0 my-face-b-2 append)
     ("　" 0 my-face-b-1 append)
     ("[ \t]+$" 0 my-face-u-1 append)
     ;;("[\r]*\n" 0 my-face-r-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

;;show EOF
(defun set-buffer-end-mark()
  (let ((overlay (make-overlay (point-max) (point-max))))
    (overlay-put overlay 'before-string #("<EOF>" 0 5 (face highlight)))
    (overlay-put overlay 'insert-behind-hooks
                 '((lambda (overlay after beg end &optional len)
                     (when after
                       (move-overlay overlay (point-max) (point-max))))))))
(add-hook 'find-file-hooks 'set-buffer-end-mark)

;;(setq navi2ch-net-http-proxy "proxy.uec.ac.jp:8080")
;;http://d.hatena.ne.jp/syohex/20110331/1301584188
(show-paren-mode 1)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)
(set-face-attribute 'show-paren-match-face nil
                    :background nil :foreground nil
                    :underline "#ffff00" :weight 'extra-bold)

;;http://dadakusa-log.blogspot.jp/2012/02/emacs.html
;; C coding style
(add-hook 'c-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))
;; Scheme coding style
(add-hook 'scheme-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))
;; Elisp coding style
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))
;; Lisp coding style
(add-hook 'lisp-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))
;; Python coding style
(add-hook 'python-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))
;; http://d.hatena.ne.jp/kitokitoki/20100516/p1
(add-hook 'diff-mode-hook
          (lambda ()
            (set-face-foreground 'diff-context-face "grey50")
            (set-face-background 'diff-header-face "black")
            ;(set-face-underline-p 'diff-header-face t)
            (set-face-foreground 'diff-file-header-face "MediumSeaGreen")
            (set-face-background 'diff-file-header-face "black")
            (set-face-foreground 'diff-index-face "MediumSeaGreen")
            (set-face-background 'diff-index-face "black")
            (set-face-foreground 'diff-hunk-header-face "plum")
            (set-face-background 'diff-hunk-header-face"black")
            (set-face-foreground 'diff-removed-face "pink")
            (set-face-background 'diff-removed-face "gray5")
            (set-face-foreground 'diff-added-face "light green")
            (set-face-foreground 'diff-added-face "white")
            (set-face-background 'diff-added-face "SaddleBrown")
            (set-face-foreground 'diff-changed-face "DeepSkyBlue1")))

(require 'python)
;http://d.hatena.ne.jp/rubikitch/20091221/autoinstall
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)             ; 互換性確保
;;auto-complete
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;;helm
(add-to-list 'load-path "~/.emacs.d/helm")
(require 'helm-config)
;zenburn-emacs
(add-to-list 'custom-theme-load-path  "~/.emacs.d/themes")
(load-theme 'zenburn t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(current-language-environment "Japanese")
 '(custom-safe-themes (quote ("3ee402a796b1bf92ad3175ac5d6f48582aa232aa7854b5edaba54801a28dd08a" default)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ricty" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
;(when
;    (load
;     (expand-file-name "~/.emacs.d/elpa/package.el"))
;  (package-initialize))
(require 'f)
(require 'hlinum)
(custom-set-variables
'(global-linum-mode t))

;; http://tkr.hatenablog.com/entry/2013/07/20/142425
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)

;; d.hatena.ne.jp/uk/ar/20120401/1333282805
(require 'flex-autopair)
(flex-autopair-mode 1)

;; elpy
(package-initialize)
(elpy-enable)
(elpy-use-ipython)

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

;; auto-follow version controlled symlink
(setq vc-follow-symlinks t)