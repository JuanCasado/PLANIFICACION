
(define (domain river)

  (:requirements
    :strips
    :fluents
    :typing
    :equality
    :universal-preconditions
    :disjunctive-preconditions
  )

  (:types
    location
    person
  )

  (:predicates 
    (connectedPerson ?from - location ?to - location)
    (connectedBoat ?from - location ?to - location)
    (boatAt ?location - location)
  )

  (:functions
    (count ?person - person ?location - location)
    (sails)
  )

  (:action embarck
    :parameters (
      ?from - location
      ?person - person
    )
    :precondition (and 
      (> (count ?person ?from) 0)
      (connectedPerson ?from BOAT)
      (boatAt ?from)
    )
    :effect (and 
      (decrease (count ?person ?from) 1)
      (increase (count ?person BOAT) 1)
    )
  )

  (:action disembarck
    :parameters (
      ?from - location
      ?person - person
    )
    :precondition (and 
      (> (count ?person BOAT) 0)
      (connectedPerson BOAT ?from)
      (boatAt ?from)
    )
    :effect (and 
      (decrease (count ?person BOAT) 1)
      (increase (count ?person ?from) 1)
    )
  )

  (:action moveBoat
    :parameters (
      ?from - location
      ?to - location
    )
    :precondition (and 
      (boatAt ?from)
      (connectedBoat ?from ?to)
      (<= (+ (count CANNIBAL BOAT) (count MISSIONER BOAT)) 2)
      (> (+ (count CANNIBAL BOAT) (count MISSIONER BOAT)) 0)
    )
    :effect (and 
      (boatAt ?to)
      (not (boatAt ?from))
      (increase (sails) 1)
    )
  )
  

)