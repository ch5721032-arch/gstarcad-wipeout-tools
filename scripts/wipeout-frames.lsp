;; wipeout-frames.lsp - Toggle wipeout frames on and off
;; Command: WIPEFRAMES
;; Usage: turn frames on while you edit, off again before plotting
(defun c:WIPEFRAMES ( / cur )
  (setq cur (getvar "WIPEOUTFRAME"))
  (if (= cur 0)
    (progn
      (setvar "WIPEOUTFRAME" 1)
      (princ "\nWipeout frames visible.")
    )
    (progn
      (setvar "WIPEOUTFRAME" 0)
      (princ "\nWipeout frames hidden.")
    )
  )
  (princ)
)
