;; -*- coding:utf-8 mode:emacs-lisp -*-
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; ================パス・変数関連================
;; (require 'packageName nil t)にすると空気を読む
(setq load-path (append
                 '("~/.emacs.d/elpa")
                 ;; '("/usr/share/emacs/site-lisp")
                 ;; '("~/.emacs.d")
                 ;; '("~/.emacs.d/elisp")
                 ;; '("~/.emacs.d/elisp/twittering-mode")
                 ;; '("~/.emacs.d/helm")
                 ;; '("~/.emacs.d/ajc-java-complete")
                 load-path))

;; ========================================
;;                 全般設定
;; ========================================
;; ================キーバインド関連================
(define-key global-map (kbd "M-?") 'help-for-help)        ; ヘルプ
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-z") 'undo)                ; undo
(global-set-key (kbd "C-c i") 'indent-region)             ; インデント
(global-set-key (kbd "C-c C-i") 'hippie-expand)          ; 補完
(global-set-key (kbd "C-c ;") 'comment-dwim)         ; コメントアウト
(global-set-key (kbd "M-C-g") 'grep)            ; grep
;; (global-set-key (kbd "C-[ M-C-g") 'goto-line)         ; 指定行へ移動
(global-set-key (kbd "C-c #") 'hs-toggle-hiding)    ; 折りたたみトグル
(global-set-key (kbd "M-y") 'helm-show-kill-ring)   ; yank list
(global-set-key (kbd "C-x f") 'helm-find-files)     ;
;; (global-set-key (kbd "C-x C-r") 'helm-recentf)       ;
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-M-x") 'execute-extended-command) ;
(global-set-key (kbd "C-c C-f") 'helm-for-files)    ;
(global-set-key (kbd "C-s-n") 'next-multiframe-window)     ;次のウィンドウ
(global-set-key (kbd "C-s-p") 'previous-multiframe-window) ;
(global-set-key (kbd "C-x C-j") 'skk-mode)
(global-set-key (kbd "C-x C-b") 'ibuffer) ;buffer-listより高級なリスト
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)
(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)
(global-set-key [f5] 'revert-buffer)
;; (global-set-key (kbd "C-<f3>") 'ahs-highlight-now)
;; (global-set-key (kbd "M-<f3>") ')
(global-set-key (kbd "<f3>")   'ahs-forward)
(global-set-key (kbd "S-<f3>") 'ahs-backward)

;; ================その他================
(auto-image-file-mode t)                ; 画像ファイルを表示
(menu-bar-mode -1)                      ; メニューバーを消す
(tool-bar-mode -1)                      ; ツールバーを消す
(blink-cursor-mode 1)                   ; カーソルの点滅をする
(setq eval-expression-print-length nil) ; evalした結果を全部表示
(show-paren-mode 1)                     ; 対応する括弧を光らせる。
(setq visible-bell t)                   ; visible bell
(setq show-paren-delay 0)
(setq show-paren-style 'mixed) ; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq kill-whole-line t) ; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq require-final-newline t)          ; 最終行に必ず一行挿入する
(setq next-line-add-newlines nil) ; バッファの最後でnewlineで新規行を追加するのを禁止する
(icomplete-mode 1)                ; 補完可能なものを随時表示
(setq history-length 100000)      ; 履歴数を大きくする
(savehist-mode 1)                 ; ミニバッファの履歴を保存する
(auto-compression-mode t)         ; gzファイルも編集できるようにする
(setq ediff-window-setup-function 'ediff-setup-windows-plain) ; ediffを1ウィンドウで実行
(setq diff-switches '("-u" "-p" "-N")) ; diffのオプション
(setq vc-follow-symlinks t)   ; auto-follow version controlled symlink
(setq suggest-key-bindings t) ; suggest keybinding
(fset 'yes-or-no-p 'y-or-n-p) ; y/n
(setq tab-indent-width 2)
(setq indent-tabs-mode nil)
(setq ediff-window-setup-function 'ediff-setup-windows-plain) ; コントロール用のバッファを同一フレーム内に表示
(setq ediff-split-window-function 'split-window-horizontally) ; diffのバッファを上下ではなく左右に並べる
(setq-default indicate-empty-lines t)   ; バッファの終端を表示
(setq gc-cons-threshold 268435456)      ; no GC until 256 MiB
(setq make-backup-files nil)            ; no ~

(set-face-attribute 'show-paren-match-face nil
                    :background nil :foreground nil
                    :underline "#ffff00" :weight 'extra-bold)

;; フォント
(when window-system
  (set-face-attribute 'default nil
                      :family "Inconsolata"
                      :height 100)
  (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Ricty")))
;; (setq face-font-rescale-alist '((".*Ricty.*" . 1.2)))

;; encode WENT UNDERGROUND
;; (set-language-environment 'Japanese)
;; (set-keyboard-coding-system 'utf-8)
;; (prefer-coding-system 'utf-8-unix)
;; (set-language-environment 'utf-8)
;; (set-default-coding-systems 'utf-8)
;; (setq default-file-name-coding-system 'utf-8)

;;================== 複行 ==================
;; zenburn-emacs
(add-to-list 'custom-theme-load-path  "~/.emacs.d/themes")
(load-theme 'zenburn t)
;; 80x47 screen (good for azurite)
(setq initial-frame-alist
      '((top . 0) (left . 0) (width . 80) (height . 47)))

;; 終了するかどうか確認
(add-hook 'kill-emacs-query-functions
          (lambda () (y-or-n-p "Emacs:Are you killing me? Really?")) 'append)

;; start server
(require 'server)
(unless (server-running-p)
  (server-start))

;; 大文字小文字の区別をしない
(setq completion-ignore-case t)                ;検索(全般)時
(setq isearch-case-fold-search t)              ;isearch時
(setq read-file-name-completion-ignore-case t) ;ファイル名の問い合わせ
(setq read-buffer-completion-ignore-case t)    ;バッファ

;;show [EOF] at EOF
(defun set-buffer-end-mark()
  (let ((overlay (make-overlay (point-max) (point-max))))
    (overlay-put overlay 'before-string #("[EOF]" 0 5 (face highlight)))
    (overlay-put overlay 'insert-behind-hooks
                 '((lambda (overlay after beg end &optional len)
                     (when after
                       (move-overlay overlay (point-max) (point-max))))))))
(add-hook 'find-file-hooks 'set-buffer-end-mark)

;; browser
;; (setq browse-url-browser-function 'browse-url-generic
;;       browse-url-generic-program "hv3")
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program
      (if (file-exists-p "/usr/bin/chromium") "chromium" "w3m"))

;; ================
;; 言語ごとの設定
;; ================
;; Any programming languaue:
(add-hook 'prog-mode-hook '(lambda ()
                             ;; (smart-newline-mode 1)
                             (setq indent-tabs-mode nil)
                             ;; (rainbow-mode)
                             (hs-minor-mode)
                             ))

;; 折り畳み
;;http://dadakusa-log.blogspot.jp/2012/02/emacs.html
;; C
;; (add-hook 'c-mode-hook '(lambda () (hs-minor-mode 1)))
;; Scheme coding style
;; (add-hook 'scheme-mode-hook '(lambda () (hs-minor-mode 1)))
;; Elisp coding style
;; (add-hook 'emacs-lisp-mode-hook '(lambda () (hs-minor-mode 1)))
;; Lisp coding style
;; (add-hook 'lisp-mode-hook '(lambda () (hs-minor-mode 1)))
;; Python coding style
(add-hook 'python-mode-hook '(lambda ()
                               (hs-minor-mode 1)
                               (auto-complete-mode -1)))
;; Java coding style
(add-hook 'java-mode-hook '(lambda ()
                             (hs-minor-mode 1)
                             (setq c-basic-offset 2)))

;; Javascript coding style
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\.gas\\'" . js2-mode))
(add-hook 'js2-mode-hook '(lambda ()
                            (setq js2-basic-offset 2)
                                        ; indent-tabs-mode nil
                            (hs-minor-mode 1)
                            ))

(add-hook 'go-mode-hook '(lambda ()
                           (setq c-basic-offset 2)
                           (setq indent-tabs-mode nil)
                           ))
(add-hook 'web-mode-hook '(lambda ()
                            (setq web-mode-markup-indent-offset 2)
                            (local-set-key (kbd "C-<return>") 'emmet-expand-line)
                            ))

;; need?
;; (require 'python)

;; ========================================
;; el-get-bundle!
;; ========================================
;; http://d.hatena.ne.jp/tarao/20150221/1424518030
(el-get-bundle tarao/with-eval-after-load-feature-el)

;; 対応する括弧が虹色になる
(el-get-bundle! rainbow-delimiters
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;; migemo
(el-get-bundle! migemo
  (setq migemo-isearch-min-length 2)    ; "Regular expression too big"対策
  )

;; anzu
(el-get-bundle! anzu
  (global-anzu-mode +1)
  (set-face-attribute 'anzu-replace-highlight nil
                      :foreground "black" :background "PaleGreen4"
                      :weight 'bold)
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(anzu-deactivate-region t)
   '(anzu-minimum-input-length 2)
   '(anzu-mode-lighter "")
   '(anzu-search-threshold 10000)
   '(anzu-use-migemo t)
   ))

;; howm
(el-get-bundle! howm
  ;; http://howm.sourceforge.jp/uu/
  (setq howm-prefix "\C-c,")
  (setq howm-menu-lang 'ja)
  (autoload 'howm-menu "howm" "Hitori Otegaru Wiki Modoki" t)
  (setq howm-keyword-case-fold-search t) ; <<< で大文字小文字を区別しない
  (setq howm-keyword-file "~/howm/.howm-keys") ;; デフォルトは ~/.howm-keys
  (setq howm-history-file "~/howm/.howm-keys")
  (setq howm-view-use-grep t)      ; 高速化される？
                                        ; http://www.naney.org/diki/d/2014-03-17-howm-Markdown-Plack.html
  (setq howm-file-name-format "%Y/%m/%Y-%m-%d-%H%M%S.md")
  (global-set-key (concat howm-prefix "n") #'howm-create-nikki)

  ;; howm日記関連
  (setq howm-template
        #'(lambda (n buf)
            (interactive "p")
            (cond
             ((= 1 n)
              "= %title%cursor
%date %file
")
             ((= 2 n)
              (concat
               "= 日記" (format-time-string "%Y/%m/%d")
               "
%date
# 睡眠%cursor
# 朝食
# 昼食
# 夕食
# 天気
# 進捗
* 
# 今日の単語
# 得点
* 
 * 
* 合計
 * 
-
")))))
  (defun howm-current-date-lazy ()
    "6時前なら昨日の日付、それ以降なら今日の日付でemacs内部時間形式で返す(時分秒とか気にしない)"
    (let ((time (decode-time (current-time))))
      (when (< (nth 2 (decode-time (current-time)))
               6)            ;←6時
        (setf (nth 3 time) (- (nth 3 time) 1)))
      (apply #'encode-time time)))
  (defun howm-nikki-file-name ()
    (concat howm-directory (format-time-string "%Y/%m/")
            "diary-" (format-time-string howm-date-format (howm-current-date-lazy)) ".md"))
  (defun howm-create-nikki ()
    (interactive)
    (if (file-exists-p (howm-nikki-file-name))
        (progn (find-file (howm-nikki-file-name))
               (howm-set-mode))
      (progn
        (howm-create 2 nil)
        (set-visited-file-name (howm-nikki-file-name)))))
  )

;; 各種空白表示
(el-get-bundle! whitespace
  (setq whitespace-line-column 160) ; 1行が160桁を超えたら長すぎると判断する
  (setq whitespace-style '(face       ; 可視化
                           trailing ; 行末の空白
                           lines-tail ; whitespace-line-column以降のみを対象とする。
                           space-before-tab ; タブの前にあるスペースを対象とする。
                           space-after-tab  ; タブの後にあるスペースを対象とする。
                           space-mark
                           tab          ; 今後タブは禁止
                           tab-mark     ; タブにマーク
                           ))
  (global-whitespace-mode 1)        ; デフォルトで視覚化を有効にする。
  ;; (global-hl-line-mode nil)      ; 現在行を目立たせる
  (column-number-mode t)   ; カーソルの位置が何文字目か
  (line-number-mode t)     ; カーソルの位置が何行目か for no main-line
  ;; (setq whitespace-action '(auto-cleanup)) ;自動削除 (auto-save-buffers-enhancedと相性が悪い)
  (setq whitespace-display-mappings   ;Tabをいい感じに表示する
        '((space-mark ?\u3000 [?\u25a1])
          (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t]))) ; 問題が起こる
  (set-face-attribute 'whitespace-tab nil
                      :foreground "LightSkyBlue"
                      :underline t))

;; 違和感の無いぬるぬるスクロール
(el-get-bundle nurumacs
  :type elpa
  (require 'nurumacs)
  (setq nurumacs-map nil))      ; 俯瞰表示させない

;; inactiveバッファを暗くする
;; 色付けした部分が見辛くなってしまう
;; (el-get-bundle! hiwin
;;   (hiwin-activate)
;;   (set-face-background 'hiwin-face "grey14"))

;; 自動保存
(el-get-bundle! auto-save-buffers-enhanced
  (setq auto-save-buffers-enhanced-include-regexps '(".+"))
  (setq auto-save-buffers-enhanced-exclude-regexps
        '("^/ssh" "^/scp" "/mnt/"))             ; ssh, scp, mnt以下のファイルは無視
  ;; (auto-save-buffers-enhanced-include-only-checkout-path t) ; gitとかのディレクトリだけ
  (setq auto-save-buffers-enhanced-quiet-save-p t)
  (auto-save-buffers-enhanced t))

;; フレーム左端にgitの状態表示
(el-get-bundle! git-gutter
  (git-gutter:linum-setup)
  (global-git-gutter-mode t)
  (global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
  (global-set-key (kbd "C-x n") 'git-gutter:next-hunk))

;; 成功したコンパイルを非表示
(el-get-bundle! bury-successful-compilation
  :type elpa
  (bury-successful-compilation 1))

;; シンボルに色を付ける
(el-get-bundle! highlight-symbol
  (global-set-key (kbd "C-<f3>") 'highlight-symbol-at-point)
  (global-set-key (kbd "C-M-<f3>") 'highlight-symbol-remove-all)
  (global-set-key [f3] 'highlight-symbol-next)
  (global-set-key (kbd "S-<f3>") 'highlight-symbol-prev)
  (global-set-key (kbd "M-<f3>") 'highlight-symbol-query-replace)
  )

;; 終了時に自動で状態保存
(el-get-bundle! desktop
  (setq desktop-load-locked-desktop t)
  (desktop-save-mode 1)
  (defun my-desktop-save ()
    (interactive)
    ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
    (if (eq (desktop-owner) (emacs-pid))
        (desktop-save desktop-dirname)))
  (add-hook 'auto-save-hook 'my-desktop-save))

;; emmet
(el-get-bundle! emmet-mode
  (require 'emmet-mode nil t)
  (add-hook 'sgml-mode-hook 'emmet-mode) ; マークアップ言語全部で使う
  (add-hook 'css-mode-hook  'emmet-mode) ; CSSにも使う
  (add-hook 'emmet-mode-hook (lambda ()
                               (setq emmet-indentation 2) ; indent はスペース2個
                               ))
  ;; (eval-after-load "emmet-mode"
  ;;   '(define-key emmet-mode-keymap (kbd "C-j") nil)) ;; C-j は newline のままにしておく
  )

;; main-line
;; (el-get-bundle! main-line
;;   (setq main-line-separator-style 'arrow14)
;;   (defmain-line row "%p %4l"))

;; power-line
(el-get-bundle! powerline
  (powerline-default-theme)
  (set-face-attribute 'mode-line nil
                      :foreground "#fff"
                      :background "#009966"
                      :box nil)
  (set-face-attribute 'powerline-active1 nil
                      :foreground "#000"
                      :background "#00B666"
                      :inherit 'mode-line)
  (set-face-attribute 'powerline-active2 nil
                      :foreground "#000"
                      :background "#00FC66"
                      :inherit 'mode-line)
  (set-face-attribute 'mode-line-inactive nil
                      :foreground "#FFF"
                      :background "#004444"
                      :box nil)
  (set-face-attribute 'powerline-inactive1 nil
                      :foreground "#000"
                      :background "#00AAAA"
                      :inherit 'mode-line)
  (set-face-attribute 'powerline-inactive2 nil
                      :foreground "#000"
                      :background "#00FFFF"
                      :inherit 'mode-line))

;;http://d.hatena.ne.jp/syohex/20130131/1359646452
(defvar mode-line-cleaner-alist
  '( ;; For minor-mode, first char is 'space'
    (yas-minor-mode . " Ys")
    (paredit-mode . " Pe")
    (eldoc-mode . "")
    (abbrev-mode . "")
    (undo-tree-mode . "")
    (git-gutter-mode . "")
    (elisp-slime-nav-mode . " EN")
    (helm-mode . "")
    (helm-gtags-mode . " HG")
    (flymake-mode . " Fm")
    (smooth-scroll-mode . "")
    ;; Major modes
    (lisp-interaction-mode . "Li")
    (python-mode . "Py")
    (ruby-mode   . "Rb")
    (emacs-lisp-mode . "El")
    (markdown-mode . "Md")
    (matlab-mode . "Mlab")
    (fundamental-mode . "Fd")           ; Why comment outed?
    (js2-mode . "JS2")
    ))

(defun clean-mode-line ()
  (interactive)
  (loop for (mode . mode-str) in mode-line-cleaner-alist
        do
        (let ((old-mode-str (cdr (assq mode minor-mode-alist))))
          (when old-mode-str
            (setcar old-mode-str mode-str))
          ;; major mode
          (when (eq mode major-mode)
            (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)

;;auto-complete
(el-get-bundle! auto-complete-config in auto-complete
  ;; (require 'auto-complete-config)
  (ac-config-default)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
  (setq ac-use-menu-map t)
  ;; (define-key ac-menu-map "\C-n" 'ac-next)
  ;; (define-key ac-menu-map "\C-p" 'ac-previous)
  (setq ac-menu-height 10))

;; elpy
(el-get-bundle! elpy
  ;; https://github.com/jorgenschaefer/elpy
  ;; (package-initialize)
  (elpy-enable)
  (elpy-use-ipython))

;; LaTeX数式プレビュー
;;(el-get-bundle! latex-math-preview)

;; twittering-mode
(el-get-bundle! twittering-mode
  ;; (require 'twittering-mode nil t)
  (setq twittering-icon-mode nil)
  (setq twittering-use-master-password t)
  (global-set-key (kbd "C-c t") 'twittering-update-status-interactive))

;; zone
;; スクリーンセーバーっぽいのは良いが、CPU食うし表示場所がズレるし不便
;; (el-get-bundle! zone-matrix
;;   :features (zone-matrix
;;              zone-matrix-settings
;;              zone-settings)
;;   (with-eval-after-load-feature
;;    'zone-matrix
;;    (setq zone-programs [
;;                         zone-pgm-jitter ; pan
;;                         zone-pgm-putz-with-case ; case changes
;;                         ;; zone-pgm-dissolve  ; too blanky
;;                         ;; zone-pgm-explode   ; too wide
;;                         zone-pgm-whack-chars ; become zzz
;;                         zone-pgm-rotate      ; rotate random direction, variable speed
;;                         ;; zone-pgm-rotate-LR-lockstep ; L to R only, same speed
;;                         ;; zone-pgm-rotate-RL-lockstep ; R to L only, same speed
;;                         ;; zone-pgm-rotate-LR-variable ; L to R only, variable speed
;;                         ;; zone-pgm-rotate-RL-variable ; R to L only, variable speed
;;                         zone-pgm-drip               ; drip
;;                         ;; zone-pgm-drip-fretfully     ; drip, too slow
;;                         ;; zone-pgm-five-oclock-swan-dive
;;                         ;; zone-pgm-martini-swan-dive ; drip, become _ after fall
;;                         ;; zone-pgm-rat-race ; rotate?
;;                         ;; zone-pgm-paragraph-spaz ; rotate?
;;                         ;; zone-pgm-stress          ; grrr
;;                         ;; zone-pgm-stress-destress ; grrr buffer after grrr
;;                         zone-pgm-random-life ; life game
;;                         ])
;;    (zone-when-idle 300)
;;    ))

;; random-splash-image
(el-get-bundle random-splash-image
  (require 'random-splash-image)
  (setq random-splash-image-dir (concat (getenv "HOME") "/.emacs.d/splash-images")) ; ランダムな画像のパス
  (random-splash-image-set))      ; ランダムな設定を実行

;; tabbar
(el-get-bundle! tabbar)

;; undohist
(el-get-bundle! undohist
  (undohist-initialize)
  (setq undohist-ignored-files '("/tmp/" "COMMIT_.*")) ; 永続化を無視するファイル名の正規表現
  ;; NTEmacsだと動かないらしいので再定義
  ;; http://d.hatena.ne.jp/Lian/20120420/1334856445
  (when (eq system-type 'windows-nt)
    (defun make-undohist-file-name (file)
      (setq file (convert-standard-filename (expand-file-name file)))
      (if (eq (aref file 1) ?:)
          (setq file (concat "/"
                             "drive_"
                             (char-to-string (downcase (aref file 0)))
                             (if (eq (aref file 2) ?/)
                                 ""
                               (if (eq (aref file 2) ?\\)
                                   ""
                                 "/"))
                             (substring file 2))))
      (setq file (expand-file-name
                  (subst-char-in-string
                   ?/ ?!
                   (subst-char-in-string
                    ?\\ ?!
                    (replace-regexp-in-string "!" "!!"  file)))
                  undohist-directory)))))

;; pomodoro
(el-get-bundle! baudtack/pomodoro
  :type http
  :url  "https://raw.githubusercontent.com/baudtack/pomodoro.el/master/pomodoro.el"
  (setq pomodoro-show-number t)
  (setq pomodoro-work-start-message "我に力を捧げよ!")
  (setq pomodoro-break-start-message "やみのま!")
  (setq pomodoro-long-break-start-message "闇に飲まれよ! (訳:お疲れ様です!)"))

;; helm-swoop
(el-get-bundle! helm-swoop
  (global-set-key (kbd "M-s M-s") 'helm-swoop))

;; flex-autopair
(el-get-bundle! flex-autopair
  (flex-autopair-mode 1))

;; f
(el-get-bundle! f)

;; hlinum
(el-get-bundle! hlinum
  (hlinum-activate))

;; volatile-highlights
(el-get-bundle! volatile-highlights
  (volatile-highlights-mode t))

;; lua
(el-get-bundle! lua-mode)

(el-get-bundle! hl-line+
  (global-hl-line-mode t))

;; web-mode
(el-get-bundle! web-mode
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.ctp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (setq web-mode-engines-alist
        '(("php"    . "\\.phtml\\'")
          ("blade"  . "\\.blade\\.")))
  (define-key web-mode-map (kbd "C-;") nil)
  (define-key web-mode-map (kbd "C-c ;") 'web-mode-comment-or-uncomment)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  )

;; undo-tree
(el-get-bundle! undo-tree
  (global-undo-tree-mode t)
  (global-set-key (kbd "M-/") 'undo-tree-redo))

;; magit
(el-get-bundle! magit
  (global-set-key (kbd "M-g t") 'magit-status)
  (setq magit-last-seen-setup-instructions "1.4.0"))

;; 色名に色を付ける
(el-get-bundle! rainbow-mode)

;; go
(el-get-bundle! go-mode)

;; markdown-mode (gfm-mode)
(el-get-bundle! markdown-mode
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
  (setq markdown-command "marked"))

;; pushbullet
(el-get-bundle! pushbullet
  ;; ~/Dropbox/config/pushbullet_token.keyがreadableならpushbullet-api-keyとして読み込む
  (cond ((file-readable-p "~/Dropbox/config/pushbullet_token.key")
         (setq pushbullet-api-key
               (with-temp-buffer
                 (insert-file-contents "~/Dropbox/config/pushbullet_token.key")
                 (buffer-string)))))
  ;; ゴミ対策
  (when (string-match "\n$" pushbullet-api-key)
    (setq pushbullet-api-key (replace-match "" nil nil pushbullet-api-key)))
  )

;; emoji-cheat-sheet
(el-get-bundle! emoji-cheat-sheet-plus)

;; js2-mode
(el-get-bundle! js2-mode)

;; php-mode
(el-get-bundle! php-mode
  (add-hook 'php-mode-hook
            '(lambda ()
               (setq indent-tabs-mode t)
               (whitespace-mode nil))))

;; indent-guide
(el-get-bundle! indent-guide
  (setq indent-guide-delay 0))

;; coffee
(el-get-bundle! coffee-mode)

;; ========================================
;;             require 'package
;; ========================================
(require 'package)
;; not works when shorted
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(package-initialize)

(require 'cl)

;; Unuseful and slow
;; (require 'auto-install)
;; (setq auto-install-directory "~/.emacs.d/elisp/")
;; (auto-install-update-emacswiki-package-name t)
;; (auto-install-compatibility-setup)             ; 互換性確保

;; 再帰的にgrep
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

(require 'saveplace)         ; カーソルの場所を保存する
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "places"))
(run-at-time 600 600 'save-place-kill-emacs-hook)

(require 'recentf nil t)
(defvar my-recentf-list-prev nil)
(defadvice recentf-save-list
    (around no-message activate)
  (unless (equal recentf-list my-recentf-list-prev)
    (cl-flet ((message (format-string &rest &args)
                       (eval `(format ,format-string ,@args)))
              (write-file (file &optional confirm)
                          (let ((str (buffer-string)))
                            (with-temp-file file (insert str)))))
      ad-do-it
      (setq my-recentf-list-prev recentf-list))))
;; (defadvice recentf-cleanup
;;     (around no-message activate)
;;   (cl-flet ((message (format-string &rest args)
;;                      (eval `(format ,format-string , @args))))
;;     ad-do-it))
(setq recentf-max-saved-items 2000)
(setq recentf-exclude '(".recentf"))
(setq recentf-auto-cleanup 'never)
(setq recentf-auto-save-timer
      (run-with-idle-timer 600 t 'recentf-save-list))
(recentf-mode 1)

(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-M-f") 'helm-for-files)
(define-key helm-map (kbd "C-h") 'delete-backward-char) ; helm C-h
;; (define-key helm-read-file-map (kbd "C-h") 'delete-backward-char) ;helm C-h
(define-key helm-read-file-map (kbd "<tab>") 'helm-execute-persistent-action)
(add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))
(add-to-list 'helm-completing-read-handlers-alist '(find-file-read-only . nil))
(add-to-list 'helm-completing-read-handlers-alist '(write-file . nil))

;; yameta
;; (require 'calfw-howm)
;; (cfw:install-howm-schedules)
;; (define-key howm-mode-map (kbd "M-C") 'cfw:open-howm-calendar)

;; ========== dired関連 ==========
(require 'dired-x)      ;diredを便利にする
(require 'wdired)         ;diredから"r"でファイル名をインライン編集
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
(require 'wgrep-helm nil t)      ;M-x grepする、*grep*バッファでC-c C-pすると書き換わる
(setq dired-listing-switches "-AFGhlrt")
(when (require 'flyspell nil t)         ;スペルチェック、要設定重点
  (defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
    (setq flymake-check-was-interrupted t))
  (ad-activate 'flymake-post-syntax-check))

;; http://qiita.com/rysk-t/items/62bb0eef4d581d9eba82
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum-highlight-face ((t (:foreground "green" :background "black"))))
 '(markdown-header-face-1 ((t (:inherit org-level-1))))
 '(markdown-header-face-2 ((t (:inherit org-level-2))))
 '(markdown-header-face-3 ((t (:inherit org-level-3))))
 '(markdown-header-face-4 ((t (:inherit org-level-4))))
 '(markdown-header-face-5 ((t (:inherit org-level-5))))
 '(markdown-header-face-6 ((t (:inherit org-level-6)))))

;; ;; http://tkr.hatenablog.com/entry/2013/07/20/142425
;; ;; http://shibayu36.hatenablog.com/entry/2013/10/29/221427
;; (require 'auto-highlight-symbol nil t)
;; (global-auto-highlight-symbol-mode t)

;; =================
;; autoinsert
;; =================
(require 'autoinsert)
(setq user-id-string "kakakaya")
(setq user-mail-address "kakakaya AT gmail.com")
(setq auto-insert-directory "~/.emacs.d/templates")
(setq auto-insert-alist
      (nconc '(
               ("\\.rst\\'" . ["template.rst" my-template])
               ("\\.py\\'" . ["template.py" my-template])
               ("\\.c\\'" . ["template.c" my-template])
               ("\\.sh\\'" . ["template.sh" my-template])
               ("\\.gas\\'" . ["template.gas" my-template])
               ("\\.php\\'" . ["template.php" my-template])
               ("README\\.md\\'" . ["template.README.md" my-template])
               ) auto-insert-alist))
(setq auto-insert-query nil)            ; Always inserts template.

(defvar template-replacements-alists
  '(("%file%"             . (lambda () (file-name-nondirectory (buffer-file-name))))
    ("%file-without-ext%" . (lambda () (file-name-sans-extension (file-name-nondirectory (buffer-file-name)))))
    ("%directory%" . (lambda () (file-name-nondirectory (directory-file-name (file-name-directory buffer-file-name)))))
    ("%date%" . (lambda() (current-time-string)))
    ("%id%" . (lambda () (identity user-id-string)))
    ("%mail%" . (lambda () (identity user-mail-address)))
    ))

(defun my-template ()
  (time-stamp)
  (mapc #'(lambda(c)
            (progn
              (goto-char (point-min))
              (replace-string (car c) (funcall (cdr c)) nil)))
        template-replacements-alists)
  (goto-char (point-max))
  (message "done."))
(add-hook 'find-file-not-found-hooks 'auto-insert)

;;======== YaTeX ========
(add-to-list 'load-path "~/.emacs.d/site-lisp/yatex")
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist
      (append '(("\\.tex\\'" . yatex-mode)
                ("\\.ltx\\'" . yatex-mode)
                ("\\.cls\\'" . yatex-mode)
                ("\\.sty\\'" . yatex-mode)
                ("\\.clo\\'" . yatex-mode)
                ("\\.bbl\\'" . yatex-mode)) auto-mode-alist))
(setq YaTeX-inhibit-prefix-letter t)
(setq YaTeX-kanji-code nil)
(setq YaTeX-latex-message-code 'utf-8)
(setq YaTeX-use-LaTeX2e t)
(setq YaTeX-use-AMS-LaTeX t)
(setq YaTeX-dvi2-command-ext-alist
      '(("SumatraPDF\\|TeXworks\\|evince\\|okular\\|firefox\\|chrome\\|AcroRd32\\|pdfopen" . ".pdf")))
(setq tex-command "ptex2pdf -u -l -ot \"-kanji=utf8 -no-guess-input-enc -synctex=1\"")
;;(setq tex-command "pdflatex -synctex=1")
;;(setq tex-command "lualatex -synctex=1")
;;(setq tex-command "luajitlatex -synctex=1")
;;(setq tex-command "xelatex -synctex=1")
;;(setq tex-command "latexmk")
;;(setq tex-command "latexmk -e \"$latex=q/uplatex %O -kanji=utf8 -no-guess-input-enc -synctex=1 %S/\" -e \"$bibtex=q/upbibtex %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/makeindex %O -o %D %S/\" -e \"$dvipdf=q/dvipdfmx %O -o %D %S/\" -norc -gg -pdfdvi")
;;(setq tex-command "latexmk -e \"$latex=q/uplatex %O -kanji=utf8 -no-guess-input-enc -synctex=1 %S/\" -e \"$bibtex=q/upbibtex %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/makeindex %O -o %D %S/\" -e \"$dvips=q/dvips %O -z -f %S | convbkmk -u > %D/\" -e \"$ps2pdf=q/ps2pdf.bat %O %S %D/\" -norc -gg -pdfps")
;;(setq tex-command "latexmk -e \"$pdflatex=q/pdflatex %O -synctex=1 %S/\" -e \"$bibtex=q/bibtex %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/makeindex %O -o %D %S/\" -norc -gg -pdf")
;;(setq tex-command "latexmk -e \"$pdflatex=q/lualatex %O -synctex=1 %S/\" -e \"$bibtex=q/bibtexu %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/makeindex %O -o %D %S/\" -norc -gg -pdf")
;;(setq tex-command "latexmk -e \"$pdflatex=q/luajitlatex %O -synctex=1 %S/\" -e \"$bibtex=q/bibtexu %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/makeindex %O -o %D %S/\" -norc -gg -pdf")
;;(setq tex-command "latexmk -e \"$pdflatex=q/xelatex %O -synctex=1 %S/\" -e \"$bibtex=q/bibtexu %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/makeindex %O -o %D %S/\" -norc -gg -pdf")
(setq bibtex-command "latexmk -e \"$latex=q/uplatex %O -kanji=utf8 -no-guess-input-enc -synctex=1 %S/\" -e \"$bibtex=q/upbibtex %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/makeindex %O -o %D %S/\" -e \"$dvipdf=q/dvipdfmx %O -o %D %S/\" -norc -gg -pdfdvi")
(setq makeindex-command "latexmk -e \"$latex=q/uplatex %O -kanji=utf8 -no-guess-input-enc -synctex=1 %S/\" -e \"$bibtex=q/upbibtex %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/makeindex %O -o %D %S/\" -e \"$dvipdf=q/dvipdfmx %O -o %D %S/\" -norc -gg -pdfdvi")
(setq dvi2-command "rundll32 shell32,ShellExec_RunDLL SumatraPDF -reuse-instance")
                                        ;(setq dvi2-command "texworks")
(setq dviprint-command-format "powershell -Command \"& {$r = Write-Output %s;$p = [System.String]::Concat('\"\"\"',[System.IO.Path]::GetFileNameWithoutExtension($r),'.pdf','\"\"\"');Start-Process pdfopen -ArgumentList ('--rxi','--file',$p)}\"")

(defun sumatrapdf-forward-search ()
  (interactive)
  (progn
    (process-kill-without-query
     (start-process
      "sumatrapdf"
      nil
      "rundll32"
      "shell32,ShellExec_RunDLL"
      "SumatraPDF"
      "-reuse-instance"
      (expand-file-name
       (concat (file-name-sans-extension (or YaTeX-parent-file
                                             (save-excursion
                                               (YaTeX-visit-main t)
                                               buffer-file-name)))
               ".pdf"))
      "-forward-search"
      (buffer-name)
      (number-to-string (save-restriction
                          (widen)
                          (count-lines (point-min) (point))))))))

(add-hook 'yatex-mode-hook
          '(lambda ()
             (define-key YaTeX-mode-map (kbd "C-c s") 'sumatrapdf-forward-search)))

(defun fwdsumatrapdf-forward-search ()
  (interactive)
  (progn
    (process-kill-without-query
     (start-process
      "fwdsumatrapdf"
      nil
      "fwdsumatrapdf"
      (expand-file-name
       (concat (file-name-sans-extension (or YaTeX-parent-file
                                             (save-excursion
                                               (YaTeX-visit-main t)
                                               buffer-file-name)))
               ".pdf"))
      (buffer-name)
      (number-to-string (save-restriction
                          (widen)
                          (count-lines (point-min) (point))))))))

(add-hook 'yatex-mode-hook
          '(lambda ()
             (define-key YaTeX-mode-map (kbd "C-c w") 'fwdsumatrapdf-forward-search)))

(add-hook 'yatex-mode-hook
          '(lambda ()
             (auto-fill-mode -1)))
;; RefTeX with YaTeX
;;(add-hook 'yatex-mode-hook 'turn-on-reftex)
(add-hook 'yatex-mode-hook
          '(lambda ()
             (reftex-mode 1)
             (define-key reftex-mode-map
               (concat YaTeX-prefix ">") 'YaTeX-comment-region)
             (define-key reftex-mode-map
               (concat YaTeX-prefix "<") 'YaTeX-uncomment-region)))

;; ========YaTeXここまで========

;; d.hatena.ne.jp/uk-ar/20120401/1333282805
(require 'flex-autopair nil t)
(flex-autopair-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(current-language-environment "Japanese")
 '(custom-safe-themes
   (quote
    ("3ee402a796b1bf92ad3175ac5d6f48582aa232aa7854b5edaba54801a28dd08a" default)))
 '(global-linum-mode t)
 '(inhibit-startup-echo-area-message "")
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t))

;; http://konbu13.hatenablog.com/entry/2014/01/12/113300
(require 'yasnippet)
;; (setq yas-snippet-dirs '("~/.emacs.d/yasnippets")) ;デフォルトが("~/.emacs.d/snippets" yas-installed-snippets-dir)
(yas-global-mode 1)

;; emms
(when (require 'emms-setup nil t)
  (emms-all)
  (emms-default-players))

;; hl-line overrides highlight-symbols
(require 'hl-line+)
(global-hl-line-mode t)
;; (require 'col-highlight)
;; (require 'crosshairs)

;; ================ mew ================
(when (autoload 'mew "mew" nil t)
  (autoload 'mew-send "mew" nil t)
  ;; Optional setup read mail menu:
  (setq read-mail-command 'mew)
  ;; Optional setup C-xm for sending a message:
  (if (boundp 'mail-user-agent)
      (setq mail-useragent 'mew-user-agent))
  (if (fboundp 'define-mail-user-agent)
      (define-mail-user-agent
        'mew-user-agent
        'mew-user-agent-compose
        'mew-draft-send-message
        'mew-draft-kill
        'mew-send-hook))

  (setq mew-proto "%")
  (setq mew-user "kakakaya@gmail.com")
  (setq mew-mail-domain "gmail.com")
  (setq mew-imap-server "imap.gmail.com")
  (setq mew-imap-user "kakakaya@gmail.com")
  (setq mew-imap-auth t)
  (setq mew-imap-ssl t)
  (setq mew-imap-ssl-port "993")
  (setq mew-smtp-auth t)
  (setq mew-smtp-ssl t)
  (setq mew-smtp-ssl-port "465")
  (setq mew-smtp-user "kakakaya@gmail.com")
  (setq mew-smtp-server "smtp.gmail.com")
  (setq mew-ssl-verify-level 0)
  (setq mew-use-cached-passwd t)
  (setq mew-prog-ssl "stunnel4")
  (setq mew-ssl-cert-directory "/etc/ssl/certs"))
;; ================ mew end ================
(when (require 'navi2ch nil t)
  (require 'navi2ch-mona)
  (custom-set-variables
   '(navi2ch-article-use-jit t)
   '(navi2ch-article-exist-message-range nil)
   '(navi2ch-article-new-message-range nil)
   '(navi2ch-mona-enable t)
   '(navi2ch-mona-use-ipa-mona t)
   '(navi2ch-mona-ipa-mona-font-family-name "mona-izmg16"))
  (navi2ch-mona-setup))

;; (when (require 'web-mode nil t)
;;   (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;;   (setq web-mode-engines-alist
;;         '(("php"    . "\\.phtml\\'")
;;           ("blade"  . "\\.blade\\.")))
;;   (define-key web-mode-map (kbd "C-;") nil)
;;   (define-key web-mode-map (kbd "C-c ;") 'web-mode-comment-or-uncomment)
;;   (setq web-mode-markup-indent-offset 2)
;;   (setq web-mode-css-indent-offset 2)
;;   (setq web-mode-code-indent-offset 2)
;;   )

(when (require 'tabbar nil t)
  (if (null tabbar-mode)
      (tabbar-mode))
  (global-set-key (kbd "<C-tab>") 'tabbar-forward-tab)  ; 次のタブ
  (global-set-key (kbd "<C-S-iso-lefttab>") 'tabbar-backward-tab) ; 前のタブ
  (tabbar-mwheel-mode nil)               ;タブ上でマウスホイールを使わない
  (setq tabbar-buffer-groups-function nil) ; グループを使わない
  ;; 左側のボタンを消す
  (dolist (btn '(tabbar-buffer-home-button
                 tabbar-scroll-left-button
                 tabbar-scroll-right-button))
    (set btn (cons (cons "" nil)
                   (cons "" nil))))
  (defvar tabbar-displayed-buffers
    '("*scratch*" "*Messages*" "*Backtrace*" "*Colors*" "*Faces*" "*Apropos*" "*Customize*" "*shell*" "*Help*" "*minimap/**scratch*" "GNU Emacs")
    "*Regexps matches buffer names always included tabs.")
  ;; 作業バッファの一部を非表示
  (setq tabbar-buffer-list-function
        (lambda ()
          (let* ((hides (list ?\ ?\*))
                 (re (regexp-opt tabbar-displayed-buffers))
                 (cur-buf (current-buffer))
                 (tabs (delq
                        nil
                        (mapcar
                         (lambda (buf)
                           (let ((name (buffer-name buf)))
                             (when (or (string-match re name)
                                       (not (memq (aref name 0) hides)))
                               buf)))
                         (buffer-list)))))
            (if (memq cur-buf tabs)
                tabs
              (cons cur-buf tabs)))))
  (setq tabbar-separator '(0.8))      ;; タブ同士の間隔
  ;; ====外観変更====
  (set-face-attribute         ;バー自体の色
   'tabbar-default nil
   :family (face-attribute 'default :family)
   :background (face-attribute 'mode-line-inactive :background)
   :height 0.9)
  (set-face-attribute         ;アクティブなタブ
   'tabbar-unselected nil
   :background (face-attribute 'mode-line-inactive :background)
   :foreground (face-attribute 'mode-line-inactive :foreground)
   :box nil)
  (set-face-attribute         ;非アクティブなタブ
   'tabbar-selected nil
   :background (face-attribute 'mode-line :background)
   :foreground (face-attribute 'mode-line :foreground)
   :box nil))
;; ================ EVAL AT LAST ================
;; ================ BELOW  FILES ================

;; skk関連
(if (file-exists-p "~/Dropbox/config/skk")
    (progn
      (setq skk-user-directory "~/Dropbox/config/skk") ;SKKの設定ファイル
      ;; (setq skk-jisyo "~/Dropbox/config/skk/.skk-jisyo")
      ))
;; (require 'skk-decor nil t)
(defun skk-j-mode-activate ()
  (interactive)
  (cond (skk-j-mode
         (skk-toggle-kana nil))
        (t
         (skk-j-mode-on))))
;; Google IME SKK変換 (Buggyなので使わないことにする)
;; (if (file-executable-p "/usr/local/bin/google-ime-skk")
;;     (progn
;;       (setq skk-server-prog "/usr/local/bin/google-ime-skk")
;;       (setq skk-server-host "0.0.0.0")
;;       (setq skk-server-portnum 55100)
;;       ))
(global-set-key (kbd "C-.") 'skk-j-mode-activate)
(global-set-key (kbd "C-<henkan>") 'skk-j-mode-activate)
(global-set-key (kbd "C-,") 'skk-latin-mode)
(global-set-key (kbd "C-<muhenkan>") 'skk-latin-mode)

(setq skk-egg-like-newline t)         ; ▼モードでEnterを押しても改行しない
(setq skk-status-indicator 'minor-mode)
(setq skk-status-indicator 'left)
(setq skk-japanese-message-and-error t) ;日本語によるメッセージ、エラー表示
(setq skk-version-codename-ja t)      ; 日本語によるバージョン表示
(setq skk-use-color-cursor t)
(setq skk-keep-record t)                ;統計を取る
(setq skk-auto-save-timer
      (run-with-idle-timer 600 t 'skk-save-jisyo))
(require 'skk nil t)
;; ;; (setq skk-use-act t)          ; This is right way but NOT WORKS, so...
;; (require 'skk-act)                      ; used this instead.
(setq skk-aquamarine-use-normal-y nil)
(el-get-bundle! skk-aquamarine
  :url "https://raw.githubusercontent.com/kakakaya/aquamarine-layout/master/ddskk/skk-aquamarine.el")
;"https://github.com/kakakaya/aquamarine-layout/ddskk/skk-aquamarine.el")

(cond ((file-readable-p "~/.emacs.d/init-local.el")
       (load "~/.emacs.d/init-local.el")))

;; Someone changes coding
(prefer-coding-system 'utf-8)

