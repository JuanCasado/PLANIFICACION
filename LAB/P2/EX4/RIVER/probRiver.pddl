
(define (problem probRiver) (:domain river)
  (:objects 
    BOAT LEFT_RIVERSIDE RIGHT_RIVERSIDE - location
    CANNIBAL MISSIONER - person
  )

  (:init
    (= (sails) 0)
    (= (count CANNIBAL LEFT_RIVERSIDE) 2)
    (= (count MISSIONER LEFT_RIVERSIDE) 1)
    (= (count CANNIBAL BOAT) 0)
    (= (count MISSIONER BOAT) 0)
    (= (count CANNIBAL RIGHT_RIVERSIDE) 0)
    (= (count MISSIONER RIGHT_RIVERSIDE) 0)
    (connectedPerson LEFT_RIVERSIDE BOAT) (connectedPerson BOAT LEFT_RIVERSIDE)
    (connectedPerson BOAT RIGHT_RIVERSIDE) (connectedPerson RIGHT_RIVERSIDE BOAT)
    (connectedBoat LEFT_RIVERSIDE RIGHT_RIVERSIDE)(connectedPerson RIGHT_RIVERSIDE LEFT_RIVERSIDE)
    (boatAt LEFT_RIVERSIDE)
  )

  (:goal (and
    (= (count CANNIBAL RIGHT_RIVERSIDE) 2)
    (= (count MISSIONER RIGHT_RIVERSIDE) 1)
  ))

  (:metric minimize (sails))

)
