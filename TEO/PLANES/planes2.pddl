
;Header and description

(define (domain airport)

;remove requirements that are not needed
(:requirements :fluents :durative-actions :typing)
 
;;;; faltan cosas

(:durative-action BOARD
    :parameters (?a - avion ?p - persona ?c - ciudad)
    :duration (= ?duration (boarding-time)) ; = 10
    :condition (and 
        (at start  (at ?p ?c))
        (over all (at ?a ?c)) ;durante todo el tiempo el avión está en la ciudad
    )
    :effect (and 
        (at start (not (at ?p ?c)))
        (at end (in ?p ?a))
    )
)

(:durative-action DEBARK
    :parameters (?a - avion ?p - persona ?c - ciudad)
    :duration (= ?duration (debarking-time))
    :condition (and 
        (at start (in ?p ?a) )
        (over all (at ?a ?c))
    )
    :effect (and 
        (at start (not (in ?p ?a)))
        (at end (at ?p ?c))
    )
)

(:durative-action FLY
    :parameters (?a -avion ?c1 ?c2 - ciudad )
    :duration (= ?duration (/ (distance ?c1 ?c2) (slow-speed ?a)))
    :condition (and 
        (at start (at ?a ?c1))
        (at start (>= (fuel ?a ?c1) (* (distance ?c1 ?c2) (slow-speed ?a))))
    )
    :effect(and (at end (decrease (fuel ?a) (* (distancee ?c1 ?c2) (slow-speed ?a))))
                (at end (decrease (total-fuel used) (* (distancee ?c1 ?c2) (slow-speed ?a))))
                (at end (at ?a ?c2))
                (at start (not (at ?a ?c1))) ; en cuanto despega ya no está en la ciudad
    )
)

(:durative-action REFUEL
    :parameters (?a - avion ?c - ciudad)
    :duration (= ?duration (/ (- (capacity ?a) (fuel ?a)) (refuel-rate ?a)))
    :condition (and 
        (at start (> (capacity ?a) (fuel ?a)))
        (over all (at ?a ?c))
    )
    :effect (at end (assign (fuel ?a) (capacity ?a)))
)

)