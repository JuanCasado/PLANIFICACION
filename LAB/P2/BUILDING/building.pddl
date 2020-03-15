;Header and description

(define (domain building)

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
  )

  ;(:constants )

  (:predicates
    (isEven ?number - number)
    (at ?lift -lift ?floor - number)
    (is ?lift -lift ?liftType - liftType)
    (moving ?lift - lift)
    (atPerson ?person - person ?at - (either lift number))
  )


  (:functions
    (moveTime ?liftType)
    (boardTime)
    (leaveTime)
    (equals ?number)
    (capacity ?lift)
    (maxCapacity ?lift)
    (totalTime)
  )

  (:durative-action move
    :parameters (
      ?lift - lift
      ?liftType - liftType
      ?from - number
      ?to - number
    )
    :duration (= ?duration (moveTime ?liftType))
    :condition (and 
      (at start (at ?lift ?from))
      (over all (is ?lift ?liftType))
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
    )
    :duration (= ?duration (boardTime))
    :condition (and 
      (at start (atPerson ?person ?floor))
      (at start (at ?lift ?floor))
      (over all (not (moving ?lift)))
      (at end (and (<= (capacity ?lift) (maxCapacity ?lift)) (>= (capacity ?lift) 0)))
    )
    :effect (and 
      (at start (not (atPerson ?person ?floor)))
      (at end (atPerson ?person ?lift))
      (at end (increase (capacity ?lift) 1))
      (at end (increase (totalTime) (boardTime)))
    )
  )

  (:durative-action leave
    :parameters (
      ?lift - lift
      ?person - person
      ?floor - number
    )
    :duration (= ?duration (leaveTime))
    :condition (and 
      (at start (atPerson ?person ?lift))
      (at start (at ?lift ?floor))
      (over all (not (moving ?lift)))
      (at end (and (<= (capacity ?lift) (maxCapacity ?lift)) (>= (capacity ?lift) 0)))
    )
    :effect (and 
      (at start (not (atPerson ?person ?lift)))
      (at end (atPerson ?person ?floor))
      (at end (decrease (capacity ?lift) 1))
      (at end (increase (totalTime) (leaveTime)))
    )
  )

)