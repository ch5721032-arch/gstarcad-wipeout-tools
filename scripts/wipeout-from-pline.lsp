;; wipeout-from-pline.lsp - Create a wipeout from a closed polyline
;; Command: WIPEOUTPL
;; Usage: pick a closed polyline that outlines the area to mask
(defun c:WIPEOUTPL ( / en )
  (setq en (car (entsel "\nSelect a closed polyline: ")))
  (if en
    (progn
      (command "_.WIPEOUT" "_P" en "_Y")
      (princ "\nWipeout created from polyline.")
    )
  )
  (princ)
)
