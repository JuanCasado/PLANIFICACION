(define (problem probPlanes)
    (:domain planes)
    (:objects
        PLANE1 - aircraft
        PLANE2 - aircraft
        CITY1 - city
        CITY2 - city
    )
    (:init
        (at PLANE1 CITY1)
        (= (distance CITY1 CITY2) 20)
        (= (distance CITY2 CITY1) 20)
        (= (speed PLANE1) 30)
        (= (speed PLANE2) 10)
    )
    (:goal (and
        (at PLANE1 CITY2)
    ))
    (:metric minimize (total-time))
)