(define (problem probrocket)
  (:domain rocket)
  
  (:objects
    r1 - rocket
    r2 - rocket
    c1 - cargo
    c2 - cargo
    c3 - cargo
    c4 - cargo
    p1 - person
    p2 - person
    l1 - location
    l2 - location
  )
  (:init
    (= (canTransportPerson r1) 1)
    (= (canTransportCargo r1) 4)
    (= (canTransportPerson r2) 1)
    (= (canTransportCargo r2) 2)
    (at r1 l1)
    (at r2 l2)
    (at c1 l2)
    (at c2 l2)
    (at c3 l1)
    (at c4 l1)
    (at p1 l1)
    (at p2 l2)
    (= (cost) 0)
  )
  
  (:goal (and
    (inSpace c1)
    (inSpace c2)
    (inSpace c3)
    (inSpace c4)
    (inSpace p1)
    (inSpace p2)
  ))
  
  (:metric minimize (cost))
)