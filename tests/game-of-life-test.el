;;; Package --- Tests for game of life in elisp

;;; Commentary:
;;;   TODO

;;; Code:

(require 'game-of-life)

(ert-deftest game-of-life-lookup-xy-test ()
  "Tests lookup-x-y function."
  (let ((board '[[t nil t]
                 [nil t nil]]))
    (should (equal (lookup-x-y board 0 0) t))
    (should (equal (lookup-x-y board 1 0) nil))
    (should (equal (lookup-x-y board 2 0) t))
    (should (equal (lookup-x-y board 0 1) nil))
    (should (equal (lookup-x-y board 1 1) t))
    (should (equal (lookup-x-y board 2 1) nil))))

(ert-deftest game-of-life-core-test ()
  "Tests game of life core survival rules."
    (should (equal (should-live 1) nil))
    (should (equal (should-live 2) t))
    (should (equal (should-live 3) t))
    (should (equal (should-live 4) nil)))

(ert-deftest game-of-life-count-neighbors-test ()
  "Tests count-neighbors function."
  (let ((board '[[nil nil nil]
                 [nil t   nil]
                 [nil nil nil]]))
    (should (equal (count-neighbors board 1 1) 0))
    (let ((board-populated '[[t   nil nil]
                             [nil t   nil]
                             [nil nil nil]]))
      (should (equal (count-neighbors board-populated 1 1) 1)))
    (let ((board-crowded '[[t t t]
                           [t t t]
                           [t t t]]))
      (should (equal (count-neighbors board-crowded 1 1) 8)))))

(provide 'game-of-life-test)

;;; game-of-life-test.el ends here
