(define (problem probBuilding) (:domain building)
  (:objects 
    N0 N1 N2 N3 N4 - number
    FAST SLOW - liftType
    L0 L1 L2 L3 - lift
    P00 P01 - person
  )

  (:init
    (= (totalTime) 0)
    (= (moveTime FAST) 1)
    (= (moveTime SLOW) 50)
    (= (boardTime) 1)
    (= (leaveTime) 1)
    (=(equals n0) 0) (=(equals n1) 1) (=(equals n2) 2) (=(equals n3) 3) (=(equals n4) 4) 
    (isEven n0) (isEven n2) (isEven n4)

    (is L0 SLOW) (at L0 N0) (= (capacity L0) 0) (= (maxCapacity L0) 1)
    (is L1 SLOW) (at L1 N0) (= (capacity L1) 0) (= (maxCapacity L1) 1)
    (is L2 FAST) (at L2 N0) (= (capacity L2) 0) (= (maxCapacity L2) 1)
    (is L3 FAST) (at L3 N0) (= (capacity L3) 0) (= (maxCapacity L3) 1)

    (atPerson P00 N0)
    (atPerson P01 N0)
  )

  (:goal (and
    (atPerson P00 N4)
    (atPerson P01 N3)
  ))

  (:metric minimize (totalTime))
)
