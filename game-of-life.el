;;; Package --- Game of life in elisp

;;; Commentary:
;;;   TODO

;;; Code:

(defun should-live (neighbor-count)
  "Given NEIGHBOR-COUNT, determine if cell should live or die."
  (cond ((< neighbor-count 2) nil)
        ((eq neighbor-count 2) t)
        ((eq neighbor-count 3) t)
        ((> neighbor-count 4) nil)
        (t nil)))

(defun count-neighbors (board x y)
  "Count live neighbor cells for BOARD given relative X and Y."
  (let ((count 0))
    (if (lookup-x-y board (- x 1) (- y 1))
        (setq count (1+ count)))
    (if (lookup-x-y board x (- y 1))
        (setq count (1+ count)))
    (if (lookup-x-y board (1+ x) (- y 1))
        (setq count (1+ count)))
    (if (lookup-x-y board (- x 1) y)
        (setq count (1+ count)))
    (if (lookup-x-y board (1+ x) y)
        (setq count (1+ count)))
    (if (lookup-x-y board (- x 1) (1+ y))
        (setq count (1+ count)))
    (if (lookup-x-y board x (1+ y))
        (setq count (1+ count)))
    (if (lookup-x-y board (1+ x) (1+ y))
        (setq count (1+ count)))
    count))

(defun lookup-x-y (board x y)
  "Convert BOARD coordinates X and Y into a 2-D vector accessor."
  (elt (elt board y) x))

(provide 'game-of-life)

;;; game-of-life.el ends here
