(define (problem probacar) 
  (:domain car)
  (:objects 
    c1 - car
    c2 - car
    P - location
    M - location
    R - location
    B - location
  )

  (:init
    (at c1 R)
    (at c2 R)
    (= (fuelLevel c1) 1000)
    (= (fuelLevel c2) 1000)
    (connected P B)(connected B P)
    (connected B R)(connected R B)
    (connected P R)(connected R P)
    (connected M P)(connected P M)
    (connected M R)(connected R M)
    (= (fuelRequired P B) 50)(= (fuelRequired B P) 50)
    (= (fuelRequired B R) 50)(= (fuelRequired R B) 50)
    (= (fuelRequired P R) 80)(= (fuelRequired R P) 80)
    (= (fuelRequired M P) 40)(= (fuelRequired P M) 40)
    (= (fuelRequired M R) 30)(= (fuelRequired R M) 30)
    (= (distance P B) 50)(= (distance B P) 50)
    (= (distance B R) 20)(= (distance R B) 20)
    (= (distance P R) 10)(= (distance R P) 10)
    (= (distance M P) 50)(= (distance P M) 50)
    (= (distance M R) 80)(= (distance R M) 80)
    (= (totalFuelUsed) 0)
    (= (fuelUsed c1) 0)
    (= (fuelUsed c2) 0)
    (= (carTime c1) 0)
    (= (carTime c2) 0)
    (= (carSpeed c1) 20)
    (= (carSpeed c1) 30)
  )

  (:goal (and
    (at c1 P)
    (at c2 P)
  ))

  ;(:metric minimize (totalFuelUsed))
  ;(:metric minimize (totalDistance))
)
