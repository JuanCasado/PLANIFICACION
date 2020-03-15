(define (problem probBuilding) (:domain building)
  (:objects 
    N0 N1 N2 N3 N4 N5 N6 N7 N8 N9 - number
    FAST SLOW - liftType
    L0 L1 L2 L3 - lift
    P00 P01 P02 P03 - person
  )

  (:init
    (= (totalTime) 0)
    (= (moveTime FAST) 1)
    (= (moveTime SLOW) 50)
    (= (boardTime) 1)
    (= (leaveTime) 1)
    (=(equals n0) 0) (=(equals n1) 1) (=(equals n2) 2) (=(equals n3) 3) (=(equals n4) 4) 
    (=(equals n5) 5) (=(equals n6) 6) (=(equals n7) 7) (=(equals n8) 8) (=(equals n9) 9)
    (isEven n0) (isEven n2) (isEven n4) (isEven n6) (isEven n8)

    (is L0 SLOW) (at L0 N0) (= (capacity L0) 0) (= (maxCapacity L0) 2)
    (is L1 SLOW) (at L1 N0) (= (capacity L1) 0) (= (maxCapacity L1) 2)
    (is L2 FAST) (at L2 N0) (= (capacity L2) 0) (= (maxCapacity L2) 2)
    (is L3 FAST) (at L3 N0) (= (capacity L3) 0) (= (maxCapacity L3) 2)

    (atPerson P00 N0)
    (atPerson P01 N2)
    (atPerson P02 N1)
    (atPerson P03 N5)
  )

  (:goal (and
    (atPerson P00 N6)
    (atPerson P01 N8)
    (atPerson P02 N5)
    (atPerson P03 N1)
  ))

  (:metric minimize (totalTime))
)
