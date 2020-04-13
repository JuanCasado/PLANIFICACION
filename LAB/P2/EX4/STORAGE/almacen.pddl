(define (domain almacen)

;remove requirements that are not needed
(:requirements :strips :fluents :durative-actions :typing :conditional-effects :negative-preconditions :equality)

(:types 
    robot 
    package 
    conveyer
    position - object
    x y - position
    station
    navmode
)

(:predicates 
    (at ?o - (either robot package station conveyer) ?xP - position ?yP - position)
    (not-busy ?x ?y - position)
    (connected ?xP1 ?yP1 ?xP2 ?yP2 - position)
    (mode ?o - robot ?n - navmode)  
    (inside ?p - package ?o - (either robot conveyer truck))  
    (truck-at-conveyer ?ca - truck ?c - conveyer)  
    (sent-truck ?ca - truck)
    (has-package ?o - robot)
)


(:functions 
    (distance ?x1 ?y1 ?x2 ?y2 - position)
    (speed ?nav - navmode)
    (loading-time ?o - robot)
    (unloading-time ?o - robot)
    (factor-battery ?o - robot) 
    (battery ?o - robot)
    (battery-capacity ?o - robot)
    (charging-ratio ?o - robot)
    (total-battery-used)
    (time-conveyer ?c - conveyer)
    (capacity-truck ?ca - truck)
    (time-truck ?ca - truck)
)

(:durative-action charge
    :parameters (?o - robot ?s - station ?x0 - x ?y0 - y)
    :duration (= ?duration (* (charging-ratio ?o) (- (battery-capacity ?o) (battery ?o))))
    :condition (and 
        (over all (at ?o ?x0 ?y0))
        (over all (at ?s ?x0 ?y0))  
    )
    :effect (and 
        (at end (assign (battery ?o) (battery-capacity ?o)))
    )
)

(:durative-action move
    :parameters (?o - robot ?xO - x ?yO - y ?xD - x ?yD - y ?nav - navmode) 
    :duration (= ?duration (/ (distance ?xO ?yO ?xD ?yD) (speed ?nav)))
    :condition (and 
        (at start (at ?o ?xO ?yO))
        (at start (not-busy ?xD ?yD))
        (over all (mode ?o ?nav))
        (over all (connected ?xO ?yO ?xD ?yD))
        (over all (> (battery ?o) (* (factor-battery ?o) (distance ?xO ?yO ?xD ?yD))))
    )
    :effect (and 
        (at start (not (at ?o ?xO ?yO)))
        (at end (not (not-busy ?xD ?yD)))
        (at end (not-busy ?xO ?yO))
        (at end (at ?o ?xD ?yD))
        (at end (increase (total-battery-used) (* (factor-battery ?o) (distance ?xO ?yO ?xD ?yD))))
        (at end (decrease (battery ?o) (* (factor-battery ?o) (distance ?xO ?yO ?xD ?yD))))
    )
)

(:durative-action loadPackage
    :parameters (?o - robot ?p - package ?x - x ?y - y)
    :duration (= ?duration (loading-time ?o))
    :condition (and
        (at start (at ?p ?x ?y))
        (at start (not (has-package ?o)))
        (over all (at ?o ?x ?y))    
        (over all (> (battery ?o) (* (factor-battery ?o) (loading-time ?o))))
    )
    :effect (and
        (at start (not (at ?p ?x ?y)))
        (at end (inside ?p ?o)) 
        (at end (has-package ?o))
        (at end (increase (total-battery-used) (* (factor-battery ?o) (loading-time ?o))))
        (at end (decrease (battery ?o) (* (factor-battery ?o) (loading-time ?o))))
    )
)

(:durative-action unloadPackage
    :parameters (?o - robot ?p - package ?c - conveyer ?x - x ?y - y )
    :duration (= ?duration (unloading-time ?o))
    :condition (and
        (at start (at ?c ?x ?y))
        (at start (inside ?p ?o))
        (at start (has-package ?o))
        (over all (at ?o ?x ?y))    
        (over all (> (battery ?o) (* (factor-battery ?o) (unloading-time ?o))))
    )
    :effect (and
        (at start (not (inside ?p ?o)))
        (at end (inside ?p ?c)) 
        (at end (not (has-package ?o)))
        (at end (increase (total-battery-used) (* (factor-battery ?o) (unloading-time ?o))))
        (at end (decrease (battery ?o) (* (factor-battery ?o) (unloading-time ?o))))
    )
)

(:durative-action movePackage
    :parameters (?p - package ?c - conveyer ?ca - truck)
    :duration (= ?duration (time-conveyer ?c))
    :condition (and
        (at start (inside ?p ?c))
        (at start (> (capacity-truck ?ca) 0))  
        (over all (truck-at-conveyer ?ca ?c))             
    )
    :effect (and
        (at start (not (inside ?p ?c))) 
        (at end (inside ?p ?ca))
        (at end (decrease (capacity-truck ?ca) 1))
    )
)

(:durative-action sendtruck
    :parameters (?ca - truck)
    :duration (= ?duration (time-truck ?ca))
    :condition (and
        (over all (= (capacity-truck ?ca) 0))       
    )
    :effect (and
        (at end (sent-truck ?ca)) 
    )
)

)