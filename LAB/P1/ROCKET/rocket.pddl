(define (domain rocket)

  (:requirements
    :equality
    :fluents 
    :negative-preconditions
    :typing
    :conditional-effects
  )

  (:types
    rocket
    cargo
    person
    location
  )
  
  (:functions
    (canTransportPerson ?rocket - rocket)
    (canTransportCargo ?rocket - rocket)
    (cost)
  )

  (:predicates
    (contains ?rocket - rocket ?content - (either person cargo))
    (at ?thing - (either rocket cargo person) ?location - location)
    (inSpace ?thing - (either cargo person rocket))
    (onBoard ?content - (either cargo person))
  )

  (:action loadCargo
    :parameters (
      ?rocket - rocket
      ?cargo - cargo
      ?location - location
    )
    :precondition (and
      (> (canTransportCargo ?rocket) 0)
      (at ?cargo ?location)
      (at ?rocket ?location)
      (not(inSpace ?rocket))
      (not(inSpace ?cargo))
      (not (onBoard ?cargo))
    )
    :effect (and 
      (decrease (canTransportCargo ?rocket) 1)
      (contains ?rocket ?cargo)
      (onBoard ?cargo)
    )
  )
  
  (:action loadPerson
    :parameters (
      ?rocket - rocket
      ?person - person
      ?location - location 
    )
    :precondition (and
      (> (canTransportPerson ?rocket) 0)
      (at ?person ?location)
      (at ?rocket ?location)
      (not(inSpace ?rocket))
      (not(inSpace ?person))
      (not (onBoard ?person))
    )
    :effect (and
      (decrease (canTransportPerson ?rocket) 1)
      (contains ?rocket ?person)
      (onBoard ?person)
    )
  )

  (:action transport
    :parameters (
      ?thing - (either person cargo)
      ?from - location
      ?to - location
    )
    :precondition (and 
      (not (= ?from ?to))
      (at ?thing ?from)
      (not (inSpace ?thing))
    )
    :effect (and 
      (not (at ?thing ?from))
      (at ?thing ?to)
      (increase (cost) 1)
    )
  )

  (:action transportRocket
    :parameters (
      ?rocket - rocket
      ?from - location
      ?to - location
    )
    :precondition (and 
      (not (= ?from ?to))
      (at ?rocket ?from)
      (not (inSpace ?rocket))
    )
    :effect (and 
      (not (at ?rocket ?from))
      (at ?rocket ?to)
      (forall (?content - (either cargo person))
        (when 
          (and 
            (contains ?rocket ?content)
          )
          (and 
            (not (at ?content ?from))
            (at ?content ?to)
            (increase (cost) 1)
          )
        )
      )
      (increase (cost) 10)
    )
  )

  (:action sendToSpace
    :parameters (
      ?rocket - rocket
      ?from - location
    )
    :precondition (and 
      (at ?rocket ?from)
      (not (inSpace ?rocket))
    )
    :effect (and 
      (inSpace ?rocket)
      (forall (?content - (either cargo person))
        (when 
          (and 
            (contains ?rocket ?content)
          )
          (and 
            (inSpace ?content)
            (not (at ?content ?from))
            (increase (cost) 100)
          )
        )
      )
      (increase (cost) 1000)
    )
  )

)