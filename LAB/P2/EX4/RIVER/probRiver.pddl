
(define (problem probRiver) (:domain river)

  (:init
    (= (count CANNIBAL LEFT_RIVERSIDE) 3)
    (= (count MISSIONER LEFT_RIVERSIDE) 3)
    (= (count CANNIBAL RIGHT_RIVERSIDE) 0)
    (= (count MISSIONER RIGHT_RIVERSIDE) 0)
    (boatAt LEFT_RIVERSIDE)
  )

  (:goal (and
    (= (count CANNIBAL RIGHT_RIVERSIDE) 3)
    (= (count MISSIONER RIGHT_RIVERSIDE) 3)
  ))

  (:constraints 
    (always (forall (?location - location) 
      (and 
        (or 
          (<= (count CANNIBAL ?location) (count MISSIONER ?location))
          (= (count MISSIONER ?location) 0)
        )
        (>= (count CANNIBAL ?location) 0)
        (>= (count MISSIONER ?location) 0)
      )
    ))
  )

)
