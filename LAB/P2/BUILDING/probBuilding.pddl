(define (problem probBuilding) (:domain building)
  (:objects 
    N0 N1 N2 N3 N4 N5 N6 N7 N8 N9 - number
    FAST SLOW - liftType
    L0 L1 L2 L3 L4 L5 - lift
    P00 P01 P02 P03 P04 P05 P06 P07 P08 P09 - person
  )

  (:init
    (= (moveTime FAST) 1)
    (= (moveTime SLOW) 50)
    (= (boardTime) 1)
    (= (leaveTime) 1)
    (=(equals n0) 0) (=(equals n1) 1) (=(equals n2) 2) (=(equals n3) 3) (=(equals n4) 4) 
    (=(equals n5) 5) (=(equals n6) 6) (=(equals n7) 7) (=(equals n8) 8) (=(equals n9) 9)
    (isEven n0) (isEven n2) (isEven n4) (isEven n6) (isEven n8)

    (is L0 SLOW) (at L0 N0) (= (capacity L0) 0) (= (maxCapacity L0) 1)
    (is L1 SLOW) (at L1 N0) (= (capacity L1) 0) (= (maxCapacity L1) 1)
    (is L2 SLOW) (at L2 N0) (= (capacity L2) 0) (= (maxCapacity L2) 1)
    (is L3 FAST) (at L3 N0) (= (capacity L3) 0) (= (maxCapacity L3) 1)
    (is L4 FAST) (at L4 N0) (= (capacity L4) 0) (= (maxCapacity L4) 1)
    (is L5 FAST) (at L5 N0) (= (capacity L5) 0) (= (maxCapacity L5) 1)

    (atPerson P00 N0)
    (atPerson P01 N0)
    (atPerson P02 N0)
    (atPerson P03 N0)
    (atPerson P04 N0)
    (atPerson P05 N0)
    (atPerson P06 N0)
    (atPerson P07 N0)
    (atPerson P08 N0)
    (atPerson P09 N0)
  )

  (:goal (and
    (atPerson P00 N0)
    (atPerson P01 N1)
    (atPerson P02 N2)
    (atPerson P03 N3)
    (atPerson P04 N4)
    (atPerson P05 N5)
    (atPerson P06 N6)
    (atPerson P07 N7)
    (atPerson P08 N8)
    (atPerson P09 N9)
  ))

  ;(:metric minimize (???))
)
