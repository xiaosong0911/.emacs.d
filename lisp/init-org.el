(require-package 'org)

(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-hide-leading-stars t)
(setq org-log-done 'time)

(setq org-todo-keywords
	  '((sequence "TODO(t)" "WAITING(w@/!)" "|" "DONE(d!)"  "CANCELED(c@/@)")))

(org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (gnuplot . t)
     (latex . t)
     (python . t)
     (sh . t)))

(provide 'init-org)

;; following settings based on https://github.com/wuyao721/51docs/blob/master/it/emacs-org-mode-pdf.org
;; before using please:
;;   1.install font STFangsong, SimHei, KaiTi
;;   2.install texlive packages
;;   3.inset option: #+LaTeX_CLASS: xecjk-article at beginning

(require 'ox-latex)

(setq org-latex-pdf-process
	  '("xelatex -interaction nonstopmode -output-directory %o %f"
		"bibtex %b"
		"xelatex -interaction nonstopmode -output-directory %o %f"
		"xelatex -interaction nonstopmode -output-directory %o %f"))

(add-to-list 'org-latex-classes
		  '("xecjk-article"
		    "\\documentclass{article}
[NO-DEFAULT-PACKAGES]
[PACKAGES]
\\usepackage[T1]{fontenc}
\\usepackage{fixltx2e}
\\usepackage{graphicx}
\\usepackage{grffile}
\\usepackage{longtable}
\\usepackage{wrapfig}
\\usepackage{rotating}
\\usepackage{amsmath}
\\usepackage{textcomp}
\\usepackage{amssymb}
\\usepackage{capt-of}
\\usepackage[colorlinks=true, linkcolor = blue, citecolor = green]{hyperref}
\\usepackage{xeCJK}
\\setCJKmainfont[BoldFont=SimHei, ItalicFont=KaiTi]{STFangsong}
[EXTRA]"
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
         ("\\paragraph{%s}" . "\\paragraph*{%s}")
         ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
