;;; Package --- Tests for game of life in elisp

;;; Commentary:
;;;   TODO

;;; Code:

(require 'game-of-life)

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

(provide 'game_of_life_test)

;;; game_of_life_test.el ends here
