(define (problem probBuilding) (:domain buildingComplete)
  (:objects 
    N0 N1 N2 N3 N4 - number
    FAST SLOW - liftType
    L0 L1 L2 L3 - lift
    P00 P01 - person
    NEXT PREVIOUS - operationType
  )

  (:init
    (= (totalTime) 0)
    (= (moveTime FAST) 1)
    (= (moveTime SLOW) 50)
    (= (boardTime) 1)
    (= (leaveTime) 1)
    (=(equals N0) 0) (=(equals N1) 1) (=(equals N2) 2) (=(equals N3) 3) (=(equals N4) 4) 
    (isEven N0) (isEven N2) (isEven N4)

    (is L0 SLOW) (at L0 N0) (capacity L0 N0) (maxCapacity L0 N1)
    (is L1 SLOW) (at L1 N0) (capacity L1 N0) (maxCapacity L1 N1)
    (is L2 SLOW) (at L2 N0) (capacity L2 N0) (maxCapacity L2 N1)
    (is L3 FAST) (at L3 N0) (capacity L3 N0) (maxCapacity L3 N1)

    (operation NEXT SLOW N0 N1) (operation NEXT SLOW N1 N2) (operation NEXT SLOW N2 N3) (operation NEXT SLOW N3 N4) 
    (operation NEXT FAST N0 N2) (operation NEXT FAST N2 N4) 
    (operation PREVIOUS SLOW N1 N0) (operation PREVIOUS SLOW N2 N1) (operation PREVIOUS SLOW N3 N2) (operation NEXT SLOW N4 N3) 
    (operation PREVIOUS FAST N2 N0) (operation PREVIOUS FAST N4 N2)

    (atPerson P00 N0)
    (atPerson P01 N0)
  )

  (:goal (and
    (atPerson P00 N4)
    (atPerson P01 N3)
  ))

  (:metric minimize (totalTime))
)
