;Header and description

(define (domain buildingComplete)

  (:requirements 
    :strips 
    :fluents 
    :durative-actions 
    :timed-initial-literals 
    :typing 
    :conditional-effects 
    :negative-preconditions 
    :equality
    :adl
  )

  (:types
    lift
    liftType
    number
    person
    operationType
  )

  ;(:constants )

  (:predicates
    (isEven ?number - number)
    (at ?lift -lift ?floor - number)
    (is ?lift -lift ?liftType - liftType)
    (moving ?lift - lift)
    (atPerson ?person - person ?at - (either lift number))
    (operation ?operationType - operationType ?liftType - liftType ?number - number ?number - number)
    (capacity ?lift - lift ?number - number)
    (maxCapacity ?lift - lift ?number - number)
  )


  (:functions
    (moveTime ?liftType - liftType)
    (boardTime)
    (leaveTime)
    (totalTime)
    (equals ?number - number)
  )

  (:durative-action move
    :parameters (
      ?lift - lift
      ?liftType - liftType
      ?operationType - operationType
      ?from - number
      ?to - number
    )
    :duration (= ?duration (moveTime ?liftType))
    :condition (and 
      (at start (at ?lift ?from))
      (over all (is ?lift ?liftType))
      (over all (operation ?operationType ?liftType ?from ?to))
      (at end (or (is ?lift SLOW) (isEven ?to)))
    )
    :effect (and 
      (at start (not (at ?lift ?from)))
      (at start (moving ?lift))
      (at end (at ?lift ?to))
      (at start (not (moving ?lift)))
      (at end (increase (totalTime) (moveTime ?liftType)))
    )
  )

  (:durative-action board
    :parameters (
      ?lift - lift
      ?person - person
      ?floor - number
      ?currentCapacity - number
      ?nextCapacity - number
      ?maxCapacity - number
    )
    :duration (= ?duration (boardTime))
    :condition (and 
      (at start (atPerson ?person ?floor))
      (at start (at ?lift ?floor))
      (over all (capacity ?lift ?currentCapacity))
      (over all (not (moving ?lift)))
      (over all (operation NEXT SLOW ?currentCapacity ?nextCapacity))
      (over all (maxCapacity ?lift ?maxCapacity))
      (at end (and (<= (equals ?nextCapacity) (equals ?maxCapacity)) (>= (equals ?nextCapacity) 0)))
    )
    :effect (and 
      (at start (not (atPerson ?person ?floor)))
      (at start (not (capacity ?lift ?currentCapacity)))
      (at end (atPerson ?person ?lift))
      (at end (capacity ?lift ?nextCapacity))
      (at end (increase (totalTime) (boardTime)))
    )
  )

  (:durative-action leave
    :parameters (
      ?lift - lift
      ?person - person
      ?floor - number
      ?currentCapacity - number
      ?nextCapacity - number
      ?maxCapacity - number
    )
    :duration (= ?duration (leaveTime))
    :condition (and 
      (at start (atPerson ?person ?lift))
      (at start (at ?lift ?floor))
      (over all (capacity ?lift ?currentCapacity))
      (over all (not (moving ?lift)))
      (over all (operation PREVIOUS SLOW ?currentCapacity ?nextCapacity))
      (over all (maxCapacity ?lift ?maxCapacity))
      (at end (and (<= (equals ?nextCapacity) (equals ?maxCapacity)) (>= (equals ?nextCapacity) 0)))
    )
    :effect (and 
      (at start (not (atPerson ?person ?lift)))
      (at start (not (capacity ?lift ?currentCapacity)))
      (at end (atPerson ?person ?floor))
      (at end (capacity ?lift ?nextCapacity))
      (at end (increase (totalTime) (leaveTime)))
    )
  )

)