(define (problem probplanes3) (:domain planes3)
  (:objects 
    PLANE0 PLANE1 PLANE2 - plane
    PASSENGER0 PASSENGER1 PASSENGER2 PASSENGER3 PASSENGER4 PASSENGER5 PASSENGER6 PASSENGER7 PASSENGER8 PASSENGER9 - passenger
    CITY0 CITY1 CITY2 CITY3 CITY4 CITY5 - city
  )

  (:init
    (= (totalFuel) 0) (= (flights) 0) (= (refuels) 0)

    (= (boardingTime PLANE0) 20) (= (debarkingTime PLANE0) 25) (= (capacity PLANE0) 10)
    (= (speed PLANE0) 50) (= (burn PLANE0) 20) (= (fuel PLANE0) 0) (= (refuelRate PLANE0) 3) (= (capacityFuel PLANE0) 3000)
    (at PLANE0 CITY0) 

    (= (boardingTime PLANE1) 20) (= (debarkingTime PLANE1) 25) (= (capacity PLANE1) 10)
    (= (speed PLANE1) 50) (= (burn PLANE0) 20) (= (fuel PLANE1) 0) (= (refuelRate PLANE1) 3) (= (capacityFuel PLANE1) 3000)
    (at PLANE1 CITY1) 

    (= (boardingTime PLANE2) 20) (= (debarkingTime PLANE2) 25) (= (capacity PLANE2) 10)
    (= (speed PLANE2) 50) (= (burn PLANE0) 20) (= (fuel PLANE2) 0) (= (refuelRate PLANE2) 3) (= (capacityFuel PLANE2) 3000)
    (at PLANE2 CITY2) 

    (= (distance CITY0 CITY0)  0) (= (distance CITY0 CITY1) 20) (= (distance CITY0 CITY2) 20) (= (distance CITY0 CITY3) 20) (= (distance CITY0 CITY4) 20) (= (distance CITY0 CITY5) 20)
    (= (distance CITY1 CITY0) 20) (= (distance CITY1 CITY1)  0) (= (distance CITY1 CITY2) 20) (= (distance CITY1 CITY3) 20) (= (distance CITY1 CITY4) 20) (= (distance CITY1 CITY5) 20)
    (= (distance CITY2 CITY0) 20) (= (distance CITY2 CITY1) 20) (= (distance CITY2 CITY2)  0) (= (distance CITY2 CITY3) 20) (= (distance CITY2 CITY4) 20) (= (distance CITY2 CITY5) 20)
    (= (distance CITY3 CITY0) 20) (= (distance CITY3 CITY1) 20) (= (distance CITY3 CITY2) 20) (= (distance CITY3 CITY3)  0) (= (distance CITY3 CITY4) 20) (= (distance CITY3 CITY5) 20)
    (= (distance CITY4 CITY0) 20) (= (distance CITY4 CITY1) 20) (= (distance CITY4 CITY2) 20) (= (distance CITY4 CITY3) 20) (= (distance CITY4 CITY4)  0) (= (distance CITY4 CITY5) 20)
    (= (distance CITY5 CITY0) 20) (= (distance CITY5 CITY1) 20) (= (distance CITY5 CITY2) 20) (= (distance CITY5 CITY3) 20) (= (distance CITY5 CITY4) 20) (= (distance CITY5 CITY5)  0)

    (at PASSENGER0 CITY0)
    (at PASSENGER1 CITY0)
    (at PASSENGER2 CITY0)
    (at PASSENGER3 CITY0)
    (at PASSENGER4 CITY1)
    (at PASSENGER5 CITY1)
    (at PASSENGER6 CITY1)
    (at PASSENGER7 CITY2)
    (at PASSENGER8 CITY2)
    (at PASSENGER9 CITY3)
  )

  (:goal (and
    (at PASSENGER0 CITY2)
    (at PASSENGER1 CITY2)
    (at PASSENGER2 CITY2)
    (at PASSENGER3 CITY3)
    (at PASSENGER4 CITY3)
    (at PASSENGER5 CITY4)
    (at PASSENGER6 CITY4)
    (at PASSENGER7 CITY5)
    (at PASSENGER8 CITY5)
    (at PASSENGER9 CITY0)
  ))

  (:metric minimize (totalFuel))
)
