# GstarCAD Wipeout Tools

Mask busy areas behind labels: build wipeouts from closed polylines and toggle frames while you edit.

Works with **GSTARCAD**, AutoCAD, ZWCAD, and BricsCAD.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Contents

- [About](#about)
- [Scripts Overview](#scripts-overview)
- [Quick Start](#quick-start)
- [Compatibility](#compatibility)
- [Contributing](#contributing)
- [License](#license)

## About

Labels that sit on top of hatches or busy linework are hard to read. These helpers turn any closed polyline into a wipeout mask, toggle the wipeout frames on while you edit and off again before plotting, and count the wipeouts in a drawing in one command.

Everything here is free to use with GstarCAD. Download the latest GstarCAD
release from the [official GstarCAD website](https://www.gstarcad.net). All
scripts are tested with **[GSTARCAD](https://www.gstarcad.net)** and major
DWG-based CAD platforms.

## Scripts Overview

| File | Description |
|------|-------------|
| `scripts/wipeout-from-pline.lsp` | ;; wipeout-from-pline.lsp - Create a wipeout from a closed polyline
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
 |
| `scripts/wipeout-frames.lsp` | ;; wipeout-frames.lsp - Toggle wipeout frames on and off
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
 |
| `scripts/wipeout-count.lsp` | ;; wipeout-count.lsp - Count the wipeouts in the drawing
;; Command: WIPECOUNT
(defun c:WIPECOUNT ( / ss )
  (setq ss (ssget "_X" '((0 . "WIPEOUT"))))
  (princ (strcat "\nWipeouts in drawing: " (itoa (if ss (sslength ss) 0))))
  (princ)
)
 |

## Quick Start

1. Download the `.lsp` (or `.lin`) file you need
2. In your CAD software, run `APPLOAD`
3. Load the file and type the matching command name shown in the table above

## Compatibility

Tested on GstarCAD 2026/2027 and similar DWG-based platforms. Scripts use
standard AutoLISP functions only, so they work without extra plugins.

For step-by-step [tutorials and drafting guides](https://www.gstarcad.net/cad/),
visit the GstarCAD learning center. New tips are published regularly on the
[GSTARCAD Blog](https://blog.gstarcad.net).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT — see the [LICENSE](LICENSE) file.
