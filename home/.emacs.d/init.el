;; -*- coding:utf-8 mode:emacs-lisp -*-
;; ================パス・変数関連================
;; (require 'packageName nil t)にすると空気を読む
(setq load-path (append
		 '("/usr/share/emacs/site-lisp")
		 '("/usr/share/emacs/site-lisp/howm")
                 '("~/.emacs.d")
		 '("~/.emacs.d/elisp")
		 '("~/.emacs.d/elpa")
		 '("~/.emacs.d/helm")
		 '("~/.emacs.d/ajc-java-complete")
                 load-path))

;; ================全般設定================
;; ================キーバインド関連================
(define-key global-map (kbd "M-?") 'help-for-help)        ; ヘルプ
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-z") 'undo)			       ; undo
(global-set-key (kbd "C-c i") 'indent-region)		       ; インデント
(global-set-key (kbd "C-c C-i") 'hippie-expand)	       ; 補完
(global-set-key (kbd "C-c ;") 'comment-dwim)	      ; コメントアウト
(global-set-key (kbd "M-C-g") 'grep)		      ; grep
(global-set-key (kbd "C-[ M-C-g") 'goto-line)	      ; 指定行へ移動
(global-set-key (kbd "C-c #") 'hs-toggle-hiding)    ; 折りたたみトグル
(global-set-key (kbd "C-M-y") 'helm-show-kill-ring) ;
(global-set-key (kbd "C-x f") 'helm-find-files)     ;
(global-set-key (kbd "C-M-x") 'execute-extended-command) ;
(global-set-key (kbd "M-x") 'helm-M-x)	      ;
(global-set-key (kbd "C-c C-f") 'helm-for-files)    ;
(global-set-key (kbd "C-s-n") 'next-multiframe-window)     ;次のウィンドウ
(global-set-key (kbd "C-s-p") 'previous-multiframe-window) ;
(global-set-key (kbd "C-x C-j") 'skk-mode)
(global-set-key (kbd "C-x C-b") 'ibuffer) ;buffer-listより高級なリスト
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)
(global-set-key [(control down)] 'scroll-up-1)
(global-set-key [(control up)] 'scroll-down-1)
(global-set-key [(control left)] 'scroll-right-1)
(global-set-key [(control right)] 'scroll-left-1)
(global-set-key [f5] 'revert-buffer)
(global-set-key (kbd "<f3>") 'highlight-symbol-at-point)
(global-set-key (kbd "M-<f3>") 'highlight-symbol-remove-all)

;; ================その他================
;; ========単行========
(auto-image-file-mode t)           ; 画像ファイルを表示
(menu-bar-mode -1)                ; メニューバーを消す
(tool-bar-mode -1)                ; ツールバーを消す
(blink-cursor-mode 1)              ; カーソルの点滅をする
(setq eval-expression-print-length nil) ; evalした結果を全部表示
(show-paren-mode 1)                ; 対応する括弧を光らせる。
(setq show-paren-delay 0)
(set-face-attribute 'show-paren-match-face nil
                    :background nil :foreground nil
                    :underline "#ffff00" :weight 'extra-bold)
(setq show-paren-style 'mixed)     ; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq kill-whole-line t)            ; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq require-final-newline t)      ; 最終行に必ず一行挿入する
(setq next-line-add-newlines nil)   ; バッファの最後でnewlineで新規行を追加するのを禁止する
(icomplete-mode 1)		    ; 補完可能なものを随時表示
(setq history-length 100000)	    ; 履歴数を大きくする
(savehist-mode 1)		    ; ミニバッファの履歴を保存する
(auto-compression-mode t)    ;;; gzファイルも編集できるようにする
(setq ediff-window-setup-function 'ediff-setup-windows-plain) ;;; ediffを1ウィンドウで実行
(setq diff-switches '("-u" "-p" "-N"))    ;;; diffのオプション
(setq vc-follow-symlinks t) ; auto-follow version controlled symlink
(setq suggest-key-bindings t) ; suggest keybinding
(fset 'yes-or-no-p 'y-or-n-p) ; y/n
(setq fancy-splash-image "/home/kakakaya/Pictures/Wallpapers/SmallTsunErio.png") ;spalsh

;(set-frame-parameter nil 'fullscreen 'maximized) ; maximize screen


;; ========複行========
;zenburn-emacs
(add-to-list 'custom-theme-load-path  "~/.emacs.d/themes")
(load-theme 'zenburn t)

;; 80x47 screen (good for azurite)
(setq initial-frame-alist
      '((top . 0) (left . 0) (width . 80) (height . 47)))

;; Ask for confirmation before quitting Emacs
(add-hook 'kill-emacs-query-functions
          (lambda () (y-or-n-p "Emacs:Are you killing me? Really?"))
          'append)

;; 大文字小文字の区別をしない
(setq completion-ignore-case t)		       ;検索(全般)時
(setq isearch-case-fold-search t)	       ;isearch時
(setq read-file-name-completion-ignore-case t) ;ファイル名の問い合わせ
(setq read-buffer-completion-ignore-case t)    ;バッファ

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-deactivate-region t)
 '(anzu-mode-lighter "")
 '(anzu-search-threshold 10000)
 '(anzu-use-migemo t)
 '(anzu-minimum-input-length 2)
 '(column-number-mode t)
 '(current-language-environment "Japanese")
 '(custom-safe-themes (quote ("3ee402a796b1bf92ad3175ac5d6f48582aa232aa7854b5edaba54801a28dd08a" default)))
 '(global-linum-mode t)
 '(inhibit-startup-echo-area-message "")
 '(show-paren-mode t))

;;show [EOF] at EOF
(defun set-buffer-end-mark()
  (let ((overlay (make-overlay (point-max) (point-max))))
    (overlay-put overlay 'before-string #("[EOF]" 0 5 (face highlight)))
    (overlay-put overlay 'insert-behind-hooks
                 '((lambda (overlay after beg end &optional len)
                     (when after
                       (move-overlay overlay (point-max) (point-max))))))))
(add-hook 'find-file-hooks 'set-buffer-end-mark)

;;font
(set-face-attribute 'default nil
		    :family "Inconsolata"
		    :height 100)
(set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Ricty"))
;(setq face-font-rescale-alist '((".*Ricty.*" . 1.2)))

;; encode
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
;(set-default-file-name-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "hv3")


;; ================言語ごとの設定================
;; 折り畳み
;;http://dadakusa-log.blogspot.jp/2012/02/emacs.html
;; C coding style
(add-hook 'c-mode-hook '(lambda () (hs-minor-mode 1)))
;; Scheme coding style
(add-hook 'scheme-mode-hook '(lambda () (hs-minor-mode 1)))
;; Elisp coding style
(add-hook 'emacs-lisp-mode-hook '(lambda () (hs-minor-mode 1)))
;; Lisp coding style
(add-hook 'lisp-mode-hook '(lambda () (hs-minor-mode 1)))
;; Python coding style
(add-hook 'python-mode-hook '(lambda () (hs-minor-mode 1)))
;; Java coding style
(add-hook 'java-mode-hook '(lambda () (hs-minor-mode 1)))

(require 'python)

;; ================パッケージrequire================
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/")
	     '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives
	     ;; not works when shorted
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(package-initialize)

(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/elisp/")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)             ; 互換性確保

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

;; ========howm========
;http://howm.sourceforge.jp/uu/
(setq howm-prefix "\C-c,")
(setq howm-menu-lang 'ja)
(global-set-key "\C-c,," 'howm-menu)
(autoload 'howm-menu "howm" "Hitori Otegaru Wiki Modoki" t)

(setq howm-keyword-case-fold-search t) ; <<< で大文字小文字を区別しない
(setq howm-keyword-file "~/howm/.howm-keys") ;; デフォルトは ~/.howm-keys
(setq howm-history-file "~/howm/.howm-keys")
;http://www.naney.org/diki/d/2014-03-17-howm-Markdown-Plack.html
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
# 全般
## 睡眠
%cursor
## 朝食

## 昼食

## 夕食

## 天気

# 進捗
* 
* 

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
	     6)				;←6時
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
;; ========howmここまで========

(require 'whitespace)
(setq whitespace-line-column 120) ; 1行が80桁を超えたら長すぎると判断する。
(setq whitespace-style '(face	 ; faceを使って視覚化する。
			 trailing	; 行末の空白を対象とする。
                         lines-tail ; whitespace-line-column以降のみを対象とする。
                         space-before-tab ; タブの前にあるスペースを対象とする。
                         space-after-tab)) ; タブの後にあるスペースを対象とする。
(global-whitespace-mode 1)	; デフォルトで視覚化を有効にする。
(global-hl-line-mode)		; 現在行を目立たせる
(column-number-mode t)		; カーソルの位置が何文字目か
(line-number-mode t)		; カーソルの位置が何行目か for no main-line
(setq whitespace-display-mappings	;Tabをいい感じに表示する
      '((space-mark ?\u3000 [?\u25a1])
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t])))
(set-face-attribute 'whitespace-tab nil
                    :foreground "LightSkyBlue"
		    :underline t)

(require 'rainbow-delimiters nil t)
;(global-rainbow-delimiters-mode t)

(require 'saveplace)			; カーソルの場所を保存する
(setq-default save-place t)

(when (require 'recentf nil t)
  (setq recentf-max-saved-items 2000)
  (setq recentf-exclude '(".recentf"))
  (setq recentf-auto-cleanup 10)
  (setq recentf-auto-save-timer
	(run-with-idle-timer 30 t 'recentf-save-list))
  (recentf-mode 1))

(require 'migemo nil t)
(setq migemo-isearch-min-length 2)	;"Regular expression too big"

(require 'helm-config)
(setq recentf-max-saved-items nil)

(require 'dired-x nil t) ;diredを便利にする
(require 'wdired nil t)  ;diredから"r"でファイル名をインライン編集する
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

(require 'flyspell nil t) ;スペルチェック、要設定重点

(require 'markdown-mode nil t)
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
;; http://qiita.com/rysk-t/items/62bb0eef4d581d9eba82
(custom-set-faces
 '(markdown-header-face-1 ((t (:inherit org-level-1))))
 '(markdown-header-face-2 ((t (:inherit org-level-2))))
 '(markdown-header-face-3 ((t (:inherit org-level-3))))
 '(markdown-header-face-4 ((t (:inherit org-level-4))))
 '(markdown-header-face-5 ((t (:inherit org-level-5))))
 '(markdown-header-face-6 ((t (:inherit org-level-6))))
)

;; http://tkr.hatenablog.com/entry/2013/07/20/142425
;; http://shibayu36.hatenablog.com/entry/2013/10/29/221427
(require 'auto-highlight-symbol nil t)
(global-auto-highlight-symbol-mode t)

;; https://github.com/jorgenschaefer/elpy
(package-initialize)
(elpy-enable)
(elpy-use-ipython)

(require 'emmet-mode nil t)
(require 'magit nil t)

;;======== YaTeX ========
(add-to-list 'load-path "~/.emacs.d/site-lisp/yatex")
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
                ("\\.ltx$" . yatex-mode)
                ("\\.cls$" . yatex-mode)
                ("\\.sty$" . yatex-mode)
                ("\\.clo$" . yatex-mode)
                ("\\.bbl$" . yatex-mode)) auto-mode-alist))
(setq YaTeX-inhibit-prefix-letter t)
(setq YaTeX-kanji-code nil)
(setq YaTeX-latex-message-code 'utf-8)
(setq YaTeX-use-LaTeX2e t)
(setq YaTeX-use-AMS-LaTeX t)
(setq YaTeX-dvi2-command-ext-alist
      '(("SumatraPDF\\|TeXworks\\|evince\\|okular\\|firefox\\|chrome\\|AcroRd32\\|pdfopen" . ".pdf")))
(setq tex-command "ptex2pdf -u -l -ot \"-kanji=utf8 -no-guess-input-enc -synctex=1\"")
;(setq tex-command "pdflatex -synctex=1")
;(setq tex-command "lualatex -synctex=1")
;(setq tex-command "luajitlatex -synctex=1")
;(setq tex-command "xelatex -synctex=1")
;(setq tex-command "latexmk")
;(setq tex-command "latexmk -e \"$latex=q/uplatex %O -kanji=utf8 -no-guess-input-enc -synctex=1 %S/\" -e \"$bibtex=q/upbibtex %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/makeindex %O -o %D %S/\" -e \"$dvipdf=q/dvipdfmx %O -o %D %S/\" -norc -gg -pdfdvi")
;(setq tex-command "latexmk -e \"$latex=q/uplatex %O -kanji=utf8 -no-guess-input-enc -synctex=1 %S/\" -e \"$bibtex=q/upbibtex %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/makeindex %O -o %D %S/\" -e \"$dvips=q/dvips %O -z -f %S | convbkmk -u > %D/\" -e \"$ps2pdf=q/ps2pdf.bat %O %S %D/\" -norc -gg -pdfps")
;(setq tex-command "latexmk -e \"$pdflatex=q/pdflatex %O -synctex=1 %S/\" -e \"$bibtex=q/bibtex %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/makeindex %O -o %D %S/\" -norc -gg -pdf")
;(setq tex-command "latexmk -e \"$pdflatex=q/lualatex %O -synctex=1 %S/\" -e \"$bibtex=q/bibtexu %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/makeindex %O -o %D %S/\" -norc -gg -pdf")
;(setq tex-command "latexmk -e \"$pdflatex=q/luajitlatex %O -synctex=1 %S/\" -e \"$bibtex=q/bibtexu %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/makeindex %O -o %D %S/\" -norc -gg -pdf")
;(setq tex-command "latexmk -e \"$pdflatex=q/xelatex %O -synctex=1 %S/\" -e \"$bibtex=q/bibtexu %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/makeindex %O -o %D %S/\" -norc -gg -pdf")
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
;(add-hook 'yatex-mode-hook 'turn-on-reftex)
(add-hook 'yatex-mode-hook
          '(lambda ()
             (reftex-mode 1)
             (define-key reftex-mode-map
	       (concat YaTeX-prefix ">") 'YaTeX-comment-region)
             (define-key reftex-mode-map
	       (concat YaTeX-prefix "<") 'YaTeX-uncomment-region)))

;; ========YaTeXここまで========

(require 'undo-tree nil t)
(global-undo-tree-mode t)
(global-set-key (kbd "M-/") 'undo-tree-redo)

;; d.hatena.ne.jp/uk-ar/20120401/1333282805
(require 'flex-autopair nil t)
(flex-autopair-mode 1)

(require 'smooth-scroll nil t)
(smooth-scroll-mode t)

(require 'skk nil t)
;; ========mainline (powerline not found)========
(require 'main-line nil t)
(setq main-line-separator-style 'arrow14)
(defmain-line row "%p %4l")

;;http://d.hatena.ne.jp/syohex/20130131/1359646452
(defvar mode-line-cleaner-alist
  '( ;; For minor-mode, first char is 'space'
    (yas-minor-mode . " Ys")
    (paredit-mode . " Pe")
    (eldoc-mode . "")
    (abbrev-mode . "")
    (undo-tree-mode . "")
    (elisp-slime-nav-mode . " EN")
    (helm-gtags-mode . " HG")
    (flymake-mode . " Fm")
    (smooth-scroll-mode . "")
    ;; Major modes
    (lisp-interaction-mode . "Li")
    (python-mode . "Py")
    (ruby-mode   . "Rb")
    (emacs-lisp-mode . "El")
    (markdown-mode . "Md")
    ;(fundamental-mode . "Fd")
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
;; ========modeline========

;; anzu http://qiita.com/syohex/items/56cf3b7f7d9943f7a7ba
;; https://github.com/syohex/emacs-anzu
(global-anzu-mode +1)
(set-face-attribute 'anzu-replace-highlight nil
                    :foreground "black" :background "PaleGreen4"
		    :weight 'bold)

;; ajc-java-complete
;; (require 'ajc-java-complete-config nil t)
;; (add-hook 'java-mode-hook 'ajc-java-complete-mode)
;; (add-hook 'find-file-hook 'ajc-4-jsp-find-file-hook)

(require 'f)

(require 'hlinum)
;(hlinum-activate)
(custom-set-faces
 ;; 前景色を白，背景色を青にする．
 '(linum-highlight-face ((t (:foreground "green" :background "black")))))

;;auto-complete
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp")
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
(setq ac-menu-height 10)

;; tabbar
(require 'tabbar)
(tabbar-mode)
(global-set-key "\M-]" 'tabbar-forward)  ; 次のタブ
(global-set-key "\M-[" 'tabbar-backward) ; 前のタブ
;; タブ上でマウスホイールを使わない
(tabbar-mwheel-mode nil)
;; グループを使わない
(setq tabbar-buffer-groups-function nil)
;; 左側のボタンを消す
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))
;; タブ同士の間隔
(setq tabbar-separator '(0.8))
;; 外観変更
(set-face-attribute			;バー自体の色
 'tabbar-default nil
 :family (face-attribute 'default :family)
 :background (face-attribute 'mode-line-inactive :background)
 :height 0.9)
(set-face-attribute			;アクティブなタブ
 'tabbar-unselected nil
 :background (face-attribute 'mode-line-inactive :background)
 :foreground (face-attribute 'mode-line-inactive :foreground)
 :box nil)
(set-face-attribute			;非アクティブなタブ
 'tabbar-selected nil
 :background (face-attribute 'mode-line :background)
 :foreground (face-attribute 'mode-line :foreground)
 :box nil)
