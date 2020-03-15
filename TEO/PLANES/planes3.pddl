;Header and description

(define (domain planes3)

  ;remove requirements that are not needed
  (:requirements 
    :strips
    :fluents
    :durative-actions
    :timed-initial-literals
    :typing
    :conditional-effects
    :negative-preconditions
    :equality
  )

  (:types
    plane
    passenger
    city
  )

  ;(:constants )

  (:predicates 
    (at ?who - (either plane passenger) ?where - city)
    (on ?passenger - passenger ?plane - plane)
    (flying ?plane - plane)
  )


  (:functions 
    (fuel ?plane - plane)
    (speed ?plane - plane)
    (burn ?plane - plane)
    (distance ?from - city ?to - city)
    (boardingTime ?plane - plane)
    (debarkingTime ?plane - plane)
    (capacity ?plane - plane)
    (capacityFuel ?plane)
    (refuelRate ?plane - plane)
    (totalFuel)
    (flights)
    (refuels)
  )

  (:durative-action board
    :parameters (
      ?plane - plane
      ?passenger - passenger
      ?city - city
    )
    :duration (= ?duration (boardingTime ?plane))
    :condition (and 
      (at start (at ?passenger ?city))
      (at start (> (capacity ?plane) 0))
      (over all (at ?plane ?city))
      (over all (not (flying ?plane)))
    )
    :effect (and 
      (at start (not (at ?passenger ?city)))
      (at end (on ?passenger ?plane))
      (at end(decrease (capacity ?plane) 1))
    )
  )

  (:durative-action debark
    :parameters (
      ?plane - plane
      ?passenger - passenger
      ?city - city
    )
    :duration (= ?duration (debarkingTime ?plane))
    :condition (and 
      (at start (on ?passenger ?plane))
      (over all (at ?plane ?city))
      (over all (not (flying ?plane)))
    )
    :effect (and 
      (at start (not (on ?passenger ?plane)))
      (at end (at ?passenger ?city))
      (at end (increase (capacity ?plane) 1))
    )
  )

  (:durative-action fly
    :parameters (
      ?from - city
      ?to - city
      ?plane - plane
    )
    :duration (= ?duration (/ (distance ?from ?to) (speed ?plane)))
    :condition (and 
      (at start (at ?plane ?from))
      (at start (>= (fuel ?plane) (* (distance ?from ?to) (burn ?plane))))
      (over all (not (= ?from ?to)))
    )
    :effect (and 
      (at start (not (at ?plane ?from)))
      (at start (flying ?plane))
      (at start (increase (flights) 1))
      (at end (at ?plane ?to))
      (at end (decrease (fuel ?plane) (* (distance ?from ?to) (burn ?plane))))
      (at end (increase (totalFuel) (* (distance ?from ?to) (burn ?plane))))
      (at end (not (flying ?plane)))
    )
  )
  
  (:durative-action refuel
    :parameters (
      ?plane - plane
      ?city - city
    )
    :duration (= ?duration (* (- (capacityFuel ?plane) (fuel ?plane)) (refuelRate ?plane)))
    :condition (and 
      (at start (< (fuel ?plane) (capacityFuel ?plane)))
      (over all (at ?plane ?city))
      (over all (not (flying ?plane)))
    )
    :effect (and 
      (at start (increase (refuels) 1))
      (at end (assign (fuel ?plane) (capacityFuel ?plane)))
      (at end (increase (totalFuel) (- (capacityFuel ?plane) (fuel ?plane))))
    )
  )
  

)