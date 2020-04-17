
(define (domain river)

  (:requirements
    :strips
    :typing
    :fluents
    :equality
    :disjunctive-preconditions
    :negative-preconditions
  )

  (:types
    location
    person
  )

  (:constants 
    LEFT_RIVERSIDE RIGHT_RIVERSIDE - location
    CANNIBAL MISSIONER - person
  )

  (:predicates 
    (boatAt ?location - location)
  )

  (:functions
    (count ?person - person ?location - location)
  )

  

  (:action move2Cannibals
    :parameters (
      ?from - location
      ?to - location
    )
    :precondition (and 
      (boatAt ?from)
      (not (= ?from ?to))
    )
    :effect (and 
      (not (boatAt ?from))
      (boatAt ?to)
      (decrease (count CANNIBAL ?from) 2)
      (increase (count CANNIBAL ?to) 2)
    )
  )

  (:action move2Missioners
    :parameters (
      ?from - location
      ?to - location
    )
    :precondition (and 
      (boatAt ?from)
      (not (= ?from ?to))
    )
    :effect (and 
      (not (boatAt ?from))
      (boatAt ?to)
      (decrease (count MISSIONER ?from) 2)
      (increase (count MISSIONER ?to) 2)
    )
  )
  
  (:action move1Cannibal
    :parameters (
      ?from - location
      ?to - location
    )
    :precondition (and 
      (boatAt ?from)
      (not (= ?from ?to))
    )
    :effect (and 
      (not (boatAt ?from))
      (boatAt ?to)
      (decrease (count CANNIBAL ?from) 1)
      (increase (count CANNIBAL ?to) 1)
    )
  )

  (:action move1Missioner
    :parameters (
      ?from - location
      ?to - location
    )
    :precondition (and 
      (boatAt ?from)
      (not (= ?from ?to))
    )
    :effect (and 
      (not (boatAt ?from))
      (boatAt ?to)
      (decrease (count MISSIONER ?from) 1)
      (increase (count MISSIONER ?to) 1)
    )
  )

  (:action move1MissionerAND1Cannibal
    :parameters (
      ?from - location
      ?to - location
    )
    :precondition (and 
      (boatAt ?from)
      (not (= ?from ?to))
    )
    :effect (and 
      (not (boatAt ?from))
      (boatAt ?to)
      (decrease (count MISSIONER ?from) 1)
      (increase (count MISSIONER ?to) 1)
      (decrease (count CANNIBAL ?from) 1)
      (increase (count CANNIBAL ?to) 1)
    )
  )

)