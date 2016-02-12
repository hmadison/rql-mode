;;; rql-mode - Highlighting for Rollbar's RQL query language

;; Version: 0.0.1
;; Author: Hunter Madison
;; Url: https://github.com/hmadison/rql-mode

;; This file is distributed under the terms the MIT license

(setq rql-keywords '("SELECT" "FROM" "WHERE" "ORDER" "GROUP" "BY" "LIMIT" "ASC" "DESC"))
(setq rql-builtin-functions '("count" "sum" "avg" "min" "max" "unix_timestamp" "concat" "concat_ws" "lower" "upper" "left" "right" "substring" "locate" "char_length" "length"))
(setq rql-constants '("item_occurrence" "deploy"))

(setq rql-highlights
  `(
     (,(regexp-opt rql-keywords t) . font-lock-keyword-face)
     (,(regexp-opt rql-builtin-functions t) . font-lock-builtin-face)
     (,(regexp-opt rql-constants t) . font-lock-constant-face)
     (";+.+$" . font-lock-comment-face)
   ))

;;;###autoload
(define-derived-mode rql-mode fundamental-mode
  (setq-local font-lock-defaults '(rql-highlights))
  (setq-local comment-start "; ")
  (setq-local comment-start-skip ";+\\s-*")
  (setq-local mode-name "rql"))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.rql\\'" . rql-mode))

(provide 'rql-mode)
