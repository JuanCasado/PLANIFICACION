
(define (domain numericBuilding)

  (:requirements 
    :adl
    :strips 
    :fluents 
    :durative-actions 
    :timed-initial-literals 
    :typing 
    :conditional-effects 
    :negative-preconditions 
    :equality
    :constraints
    :preferences
  )

  (:types
    lift
    direction
    person
  )

  ;(:constants )

  (:predicates
    (moving ?lift)
    (on ?person ?lift)
  )


  (:functions
    (maxFloors)
    (speed ?lift)
    (atFloorLift ?lift - lift)
    (atFloorPerson ?person - person)
    (currentCapacity ?lift)
    (maxCapacity ?lift)
    (movement ?lift ?direction)
    (totalTime)
  )

  (:durative-action move
    :parameters (
      ?lift - lift
      ?direction - direction
    )
    :duration (= ?duration (/ (movement ?lift UP) (speed ?lift)))
    :condition (and 
      (at end (and (< (atFloorLift ?lift) (maxFloors)) (>= (atFloorLift ?lift) 0)))
    )
    :effect (and 
      (at start (moving ?lift))
      (at end (not (moving ?lift)))
      (at end (increase (atFloorLift ?lift) (movement ?lift ?direction)))
      (at end (increase (totalTime) (/ (movement ?lift UP) (speed ?lift))))
    )
  )

  (:durative-action board
    :parameters (
      ?person - person
      ?lift - lift
    )
    :duration (= ?duration 1)
    :condition (and 
      (at start (not (on ?person ?lift)))
      (at start (= (atFloorLift ?lift) (atFloorPerson ?person)))
      (at end (< (currentCapacity ?lift) (maxCapacity ?lift)))
      (over all (not (moving ?lift)))
    )
    :effect (and 
      (at end (increase (currentCapacity ?lift) 1))
      (at end (on ?person ?lift))
      (at end (increase (totalTime) 1))
    )
  )

  (:durative-action leave
    :parameters (
      ?person - person
      ?lift - lift
    )
    :duration (= ?duration 1)
    :condition (and 
      (at start (on ?person ?lift))
      (over all (not (moving ?lift)))
    )
    :effect (and 
      (at end (decrease (currentCapacity ?lift) 1))
      (at end (not (on ?person ?lift)))
      (at end (assign (atFloorPerson ?person) (atFloorLift ?lift)))
      (at end (increase (totalTime) 1))
    )
  )

)