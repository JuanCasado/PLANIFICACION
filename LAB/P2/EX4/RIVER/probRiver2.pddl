
(define (problem probRiver2) (:domain river)

  (:init
    (= (count CANNIBAL LEFT_RIVERSIDE) 2)
    (= (count MISSIONER LEFT_RIVERSIDE) 2)
    (= (count CANNIBAL RIGHT_RIVERSIDE) 0)
    (= (count MISSIONER RIGHT_RIVERSIDE) 0)
    (boatAt LEFT_RIVERSIDE)
  )

  (:goal (and
    (= (count CANNIBAL RIGHT_RIVERSIDE) 2)
    (= (count MISSIONER RIGHT_RIVERSIDE) 2)
  ))

)
