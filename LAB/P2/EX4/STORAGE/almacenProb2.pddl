(define (problem almacenProb2) (:domain almacen)
(:objects 
    FastRobot - robot
    SlowRobot - robot
    N0 N1 - navmode

    chargeStation - station
    x0 x1 x2 x3 x4 x5 x6 x7 x8 - x
    y0 y1 y2 y3 y4 y5 y6 - y

    p1 p2 p3 p4 p5 - package
    conveyer1 conveyer2 - conveyer
    truck1 truck2 - truck
)

(:init
    (connected x1 y1 x2 y1) (connected x2 y1 x3 y1) (connected x3 y1 x4 y1) (connected x4 y1 x5 y1) 
    (connected x5 y1 x5 y2) (connected x5 y2 x5 y3) (connected x5 y3 x5 y4) (connected x5 y4 x5 y5) (connected x5 y5 x5 y6)
    (connected x6 y2 x6 y3) (connected x6 y3 x6 y4) (connected x6 y5 x6 y6) 
    (connected x7 y2 x7 y3) (connected x7 y3 x7 y4) (connected x7 y5 x7 y6) 
    (connected x8 y2 x7 y3) (connected x8 y3 x8 y4) (connected x8 y4 x8 y5) (connected x8 y5 x8 y6)
    (connected x5 y2 x6 y2) (connected x6 y2 x7 y2) (connected x7 y2 x8 y2) 
    (connected x5 y6 x6 y6) (connected x6 y6 x7 y6) (connected x7 y6 x8 y6)

    (connected x2 y1 x1 y1) (connected x3 y1 x2 y1) (connected x4 y1 x3 y1) (connected x5 y1 x4 y1) 
    (connected x5 y2 x5 y1) (connected x5 y3 x5 y2) (connected x5 y4 x5 y3) (connected x5 y5 x5 y4) (connected x5 y6 x5 y5)
    (connected x6 y3 x6 y2) (connected x6 y4 x6 y3) (connected x6 y6 x6 y5) 
    (connected x7 y3 x7 y2) (connected x7 y4 x7 y3) (connected x7 y6 x7 y5) 
    (connected x7 y3 x8 y2) (connected x8 y4 x8 y3) (connected x8 y5 x8 y4) (connected x8 y6 x8 y5)
    (connected x6 y2 x5 y2) (connected x7 y2 x6 y2) (connected x8 y2 x7 y2) 
    (connected x6 y6 x5 y6) (connected x7 y6 x6 y6) (connected x8 y6 x7 y6)
    (connected x3 y2 x3 y1) (connected x3 y1 x3 y2)

    (not-busy x1 y1) (not-busy x2 y1) (not-busy x3 y1) (not-busy x4 y1) (not-busy x5 y1) 
    (not-busy x5 y2) (not-busy x6 y2) (not-busy x7 y2) (not-busy x8 y2) 
    (not-busy x5 y3) (not-busy x6 y3) (not-busy x7 y3) (not-busy x8 y3) 
    (not-busy x5 y4) (not-busy x6 y4) (not-busy x7 y4) (not-busy x8 y4) 
    (not-busy x5 y5) (not-busy x6 y5) (not-busy x7 y5) (not-busy x8 y5) 
    (not-busy x6 y6) (not-busy x7 y6) (not-busy x3 y2)


    (=(distance x1 y1 x2 y1) 1) (=(distance x2 y1 x3 y1) 1) (=(distance x3 y1 x4 y1) 1) (=(distance x4 y1 x5 y1) 1) 
    (=(distance x5 y1 x5 y2) 1) (=(distance x5 y2 x5 y3) 1) (=(distance x5 y3 x5 y4) 1) (=(distance x5 y4 x5 y5) 1) (=(distance x5 y5 x5 y6) 1)
    (=(distance x6 y2 x6 y3) 1) (=(distance x6 y3 x6 y4) 1) (=(distance x6 y4 x6 y5) 1) (=(distance x6 y5 x6 y6) 1) 
    (=(distance x7 y2 x7 y3) 1) (=(distance x7 y3 x7 y4) 1) (=(distance x7 y4 x7 y5) 1) (=(distance x7 y5 x7 y6) 1) 
    (=(distance x8 y2 x7 y3) 1) (=(distance x8 y3 x8 y4) 1) (=(distance x8 y4 x8 y5) 1) (=(distance x8 y5 x8 y6) 1)
    (=(distance x5 y2 x6 y2) 1) (=(distance x6 y2 x7 y2) 1) (=(distance x7 y2 x8 y2) 1) 
    (=(distance x5 y6 x6 y6) 1) (=(distance x6 y6 x7 y6) 1) (=(distance x7 y6 x8 y6) 1)

    (=(distance x2 y1 x1 y1) 1) (=(distance x3 y1 x2 y1) 1) (=(distance x4 y1 x3 y1) 1) (=(distance x5 y1 x4 y1) 1) 
    (=(distance x5 y2 x5 y1) 1) (=(distance x5 y3 x5 y2) 1) (=(distance x5 y4 x5 y3) 1) (=(distance x5 y5 x5 y4) 1) (=(distance x5 y6 x5 y5) 1)
    (=(distance x6 y3 x6 y2) 1) (=(distance x6 y4 x6 y3) 1) (=(distance x6 y5 x6 y4) 1) (=(distance x6 y6 x6 y5) 1) 
    (=(distance x7 y3 x7 y2) 1) (=(distance x7 y4 x7 y3) 1) (=(distance x7 y5 x7 y4) 1) (=(distance x7 y6 x7 y5) 1) 
    (=(distance x7 y3 x8 y2) 1) (=(distance x8 y4 x8 y3) 1) (=(distance x8 y5 x8 y4) 1) (=(distance x8 y6 x8 y5) 1)
    (=(distance x6 y2 x5 y2) 1) (=(distance x7 y2 x6 y2) 1) (=(distance x8 y2 x7 y2) 1) 
    (=(distance x6 y6 x5 y6) 1) (=(distance x7 y6 x6 y6) 1) (=(distance x8 y6 x7 y6) 1) (=(distance x3 y1 x3 y2) 1)
    (=(distance x3 y2 x3 y1) 1)

    (at chargeStation x3 y2)
    (at FastRobot x5 y6) 
    (not (has-package FastRobot))
    (= (factor-battery FastRobot) 5)
    (= (battery FastRobot) 70)
    (= (battery-capacity FastRobot) 70)
    (= (loading-time FastRobot) 2)
    (= (unloading-time FastRobot) 3)
    (= (charging-ratio FastRobot) 3)
    (mode FastRobot N0)

    (at SlowRobot x8 y6) 
    (not (has-package SlowRobot))
    (= (factor-battery SlowRobot) 0.2)
    (= (battery SlowRobot) 100)
    (= (battery-capacity SlowRobot) 100)
    (= (loading-time SlowRobot) 1)
    (= (unloading-time SlowRobot) 1)
    (= (total-battery-used) 0)
    (= (charging-ratio SlowRobot) 3)
    (mode SlowRobot N1)

    (at p1 x5 y3)
    (at p2 x7 y2)
    (at p3 x7 y4)
    (at p4 x8 y4)
    (at p5 x6 y4)

    (at conveyer1 x1 y1) 
    (at conveyer2 x5 y1) 
    (truck-at-conveyer truck1 conveyer1) 
    (truck-at-conveyer truck2 conveyer2) 
    
    (= (capacity-truck truck1) 2)
    (= (capacity-truck truck2) 3)

    (= (time-truck truck1) 5)
    (= (time-truck truck2) 5)

    (= (time-conveyer conveyer1) 2)
    (= (time-conveyer conveyer2) 3)

    (= (speed N0) 2)
    (= (speed N1) 1)
)

(:goal (and (sent-truck truck1) (sent-truck truck2)))

(:metric minimize (total-time))

)
