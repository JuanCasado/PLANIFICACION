(define (domain car)

  (:requirements 
    :strips 
    :fluents 
    :durative-actions
    :typing 
    ;:negative-preconditions 
    :equality
  )
  (:types
    car
    location
  )

  (:predicates
    (at ?car - car ?location - location)
    (connected ?location1 - location  ?location2 - location)
  )

  (:functions
    (fuelLevel ?car - car)
    (fuelUsed ?car - car)
    (fuelRequired ?location1 - location ?location2 - location)
    (distance ?location1 - location ?location2 - location)
    (carSpeed ?car - car)
    (carTime ?car - car)
    (totalFuelUsed)
    (totalDistance)
  )

  (:durative-action drive
    :parameters (
      ?car - car
      ?from - location
      ?to - location
    )
    :duration (= ?duration (/ (distance ?from ?to) (carSpeed ?car)))
    :condition (and 
      (at start (at ?car ?from))
      (at start (connected ?from  ?to))
      (at start (>= (fuelLevel ?car) (fuelRequired ?from ?to)))
    )
    :effect (and 
      (at end (at ?car ?to))
      (at start (not (at ?car ?from)))
      (at end (at ?car ?to))
      (at start (decrease (fuelLevel ?car) (fuelRequired ?from ?to)))
      (at start (increase (totalFuelUsed) (fuelRequired ?from ?to)))
      (at start (increase (fuelUsed ?car) (fuelRequired ?from ?to)))
      (at start (increase (carTime ?car) (/ (distance ?from ?to) (carSpeed ?car))))
      (at start (increase (totalDistance) (/ (distance ?from ?to) (carSpeed ?car))))
    )
  )
  

)