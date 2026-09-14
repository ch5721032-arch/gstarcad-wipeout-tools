;; wipeout-count.lsp - Count the wipeouts in the drawing
;; Command: WIPECOUNT
(defun c:WIPECOUNT ( / ss )
  (setq ss (ssget "_X" '((0 . "WIPEOUT"))))
  (princ (strcat "\nWipeouts in drawing: " (itoa (if ss (sslength ss) 0))))
  (princ)
)
