(define (problem probNumericBuilding) (:domain numericBuilding)
  (:objects 
    L0 L1 L2 L3 L4 - lift
    L5 L6 L7 L8 L9 - lift
    UP DOWN - direction
    P0 P1 P2 P3 P4 P5 P6 P7 P8 P9 - person
  )

  (:init
    (= (totalTime) 0)
    (= (maxFloors) 10)

    ;FAST
    (= (movement L0 UP) 2) (= (movement L0 DOWN) -2) (= (speed L0) 4) 
    (= (currentCapacity L0) 0) (= (maxCapacity L0) 2)
    (= (atFloorLift L0) 0)

    (= (movement L1 UP) 2) (= (movement L1 DOWN) -2) (= (speed L1) 4) 
    (= (currentCapacity L1) 0) (= (maxCapacity L2) 2)
    (= (atFloorLift L1) 0)

    (= (movement L2 UP) 2) (= (movement L2 DOWN) -2) (= (speed L2) 4)
    (= (currentCapacity L2) 0) (= (maxCapacity L2) 2)
    (= (atFloorLift L2) 0)

    (= (movement L3 UP) 2) (= (movement L3 DOWN) -2) (= (speed L3) 4)
    (= (currentCapacity L3) 0) (= (maxCapacity L3) 2)
    (= (atFloorLift L3) 0)

    (= (movement L4 UP) 2) (= (movement L4 DOWN) -2) (= (speed L4) 4) 
    (= (currentCapacity L4) 0) (= (maxCapacity L4) 2)
    (= (atFloorLift L4) 0)

    ;SLOW
    (= (movement L5 UP) 1) (= (movement L5 DOWN) -1) (= (speed L5) 1) 
    (= (currentCapacity L5) 0) (= (maxCapacity L5) 2)
    (= (atFloorLift L5) 0)

    (= (movement L6 UP) 1) (= (movement L6 DOWN) -1) (= (speed L6) 1) 
    (= (currentCapacity L6) 0) (= (maxCapacity L6) 2)
    (= (atFloorLift L6) 0)

    (= (movement L7 UP) 1) (= (movement L7 DOWN) -1) (= (speed L7) 1) 
    (= (currentCapacity L7) 0) (= (maxCapacity L7) 2)
    (= (atFloorLift L7) 0)

    (= (movement L8 UP) 1) (= (movement L8 DOWN) -1) (= (speed L8) 1) 
    (= (currentCapacity L8) 0) (= (maxCapacity L8) 2)
    (= (atFloorLift L8) 0)

    (= (movement L9 UP) 1) (= (movement L9 DOWN) -1) (= (speed L9) 1) 
    (= (currentCapacity L9) 0) (= (maxCapacity L9) 2)
    (= (atFloorLift L9) 0)

    ;PERSONS
    (= (atFloorPerson P0) 2)
    (= (atFloorPerson P1) 2)
    (= (atFloorPerson P2) 4)
    (= (atFloorPerson P3) 4)
    (= (atFloorPerson P4) 6)
    (= (atFloorPerson P5) 1)
    (= (atFloorPerson P6) 1)
    (= (atFloorPerson P7) 7)
    (= (atFloorPerson P8) 7)
    (= (atFloorPerson P9) 9)

  )

  (:goal (and
    (= (atFloorPerson P0) 0)
    (= (atFloorPerson P1) 4)
    (= (atFloorPerson P2) 8)
    (= (atFloorPerson P3) 8)
    (= (atFloorPerson P4) 8)
    (= (atFloorPerson P5) 4)
    (= (atFloorPerson P6) 3)
    (= (atFloorPerson P7) 3)
    (= (atFloorPerson P8) 3)
    (= (atFloorPerson P9) 1)
  ))

  (:metric minimize (totalTime))
)
