;; -*-emacs-lisp-*-

;;;
;;; ESS configuration
;;;

(require 'ess-site)

(defun R-table-region (beg end)
  (interactive "r")
  (let ((buf (current-buffer))
        (fifo (make-temp-file "fifo"))
        (tmpfile (make-temp-file "ess")))
    (with-temp-file tmpfile
      (insert-buffer-substring-no-properties buf beg end)
      ;; R complains if the data file does not end with newline
      (let ((lchar (char-after (1- (point-max)))))
        (when (and (/= lchar ?\n) (/= lchar ?\r))
          (goto-char (point-max))
          (insert ?\n))))
    (shell-command-to-string
     (format "rm -f %s && mkfifo %s" fifo fifo))
    (ess-display-help-on-object "read.table")
    (let ((params (read-from-minibuffer
                   (format "additional parameter(s) [%s]: " tmpfile))))
      (let ((proc (start-process-shell-command
                   "ess-fifo" nil
                   (format "cat %s > %s" tmpfile fifo))))
        (process-put proc 'fifo fifo)
        (process-put proc 'data tmpfile)
        (set-process-sentinel
         proc
         (lambda (p event)
           ;; (message "sentinel[%S] %S %s" p (process-status p) event)
           (ignore-errors (delete-file (process-get p 'fifo)))
           (ignore-errors (delete-file (process-get p 'data))))))
      (ess-switch-to-ESS 'eob-p)
      (ess-eval-linewise
       (format "read.table(fifo(\"%s\"), %s)" fifo params))
                                        ;(ess-switch-to-ESS 'eob-p)
      (message "You can access the table from \".Last.value\"")))
  ;;(ignore-errors (delete-file fifo))
  ;;(ignore-errors (delete-file tmpfile))
  )