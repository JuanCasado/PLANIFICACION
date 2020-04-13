
(define (domain jungle)

  (:requirements 
    :strips 
    :fluents 
    :durative-actions 
    :timed-initial-literals 
    :typing 
    :conditional-effects 
    :negative-preconditions 
    :duration-inequalities 
    :equality
  )

  (:types
    node
    interestPoint
    camp - interestPoint
    lane - interestPoint
  )

  ;(:constants )

  (:predicates
    (connected ?from - node ?to - node)
    (has ?node - node ?interestPoint - interestPoint)
    (at ?node - node)
    (up ?camp - camp)
    (ganked)
    (gankedlane ?lane - lane)
  )


  (:functions
    (distance ?from - node ?to - node)
    (timeToDo ?camp - camp)
    (gold ?camp - camp)
    (xp ?camp - camp)
    (velocity)
    (playerGold)
    (playerXP)
    (campsDone)
    (campsToDoBeforeGank)
  )

  (:durative-action move
    :parameters (
      ?from - node
      ?to - node
    )
    :duration (= ?duration (/ (distance ?from ?to) (velocity)))
    :condition (and 
      (at start (at ?from))
      (over all (connected ?from ?to))
    )
    :effect (and 
      (at start (not (at ?from)))
      (at end (at ?to))
    )
  )

  (:durative-action doCamp
    :parameters (
      ?node - node
      ?camp - camp
    )
    :duration (= ?duration (timeToDo ?camp))
    :condition (and 
      (at start (up ?camp))
      (over all (at ?node))
      (over all (has ?node ?camp))
    )
    :effect (and 
      (at start (not (up ?camp)))
      (at end (increase (campsDone) 1))
      (at end (increase (playerGold) (gold ?camp)))
      (at end (increase (playerXP) (xp ?camp)))
    )
  )

  (:action gank
    :parameters (
      ?node - node
      ?lane - lane
    )
    :precondition (and 
      (at ?node)
      (has ?node ?lane)
      (> (campsDone) (campsToDoBeforeGank))
    )
    :effect (and 
      (gankedlane ?lane)
      (ganked)
    )
  )
  

)