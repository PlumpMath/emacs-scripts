;; -*-emacs-lisp-*-

;;;
;;; Helm configuration
;;;

(require 'helm)
(require 'helm-config)

(global-set-key [(control ?x) (control ?a)] 'helm-command-prefix)
;; (global-unset-key [(control ?x) ?c])

(substitute-key-definition [(meta ?x)]
                           [(meta ?X)]
                           (current-global-map))
(global-set-key [(meta ?x)] 'helm-M-x)

(substitute-key-definition [(control ?x) (control ?b)]
                           [(control ?x) (control ?B)]
                           (current-global-map))
(global-set-key [(control ?x) (control ?b)] 'helm-buffers-list)

(substitute-key-definition [(control ?x) (control ?f)]
                           [(control ?x) (control ?F)]
                           (current-global-map))
(global-set-key [(control ?x) (control ?f)] 'helm-find-files)


;; See http://tuhdo.github.io/helm-intro.html

;; rebind tab to do persistent action
(define-key helm-map [(tab)] 'helm-execute-persistent-action)
;; make TAB works in terminal
(define-key helm-map [(control ?i)] 'helm-execute-persistent-action)

;; list actions using C-z
(define-key helm-map [(control ?z)] 'helm-select-action)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))


(setq
 ;; open helm buffer inside current window, not occupying whole other
 ;; window
 ;;
 ;; helm-split-window-in-side-p t

 ;; move to end or beginning of source when reaching top or
 ;; bottom of source.
 ;;
 ;; helm-move-to-line-cycle-in-source t

 ;; search for library in `require' and `declare-function'
 ;; sexp.
 helm-ff-search-library-in-sexp t

 ;; scroll 8 lines other window using M-<next>/M-<prior>
 helm-scroll-amount 8

 helm-ff-file-name-history-use-recentf t)