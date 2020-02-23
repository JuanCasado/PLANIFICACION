(define (domain planes)

    (:requirements
        :durative-actions
        :equality
        :negative-preconditions
        :typing
    )

    (:types
        city
        aircraft
    )

    (:predicates
        (at ?aircraft - aircraft ?city - city)
    )

    (:functions
        (distance ?city1 - city ?city2 - city)
        (speed ?aircraft - aircraft)
    )

    (:durative-action fly
        :parameters (
            ?aircraft - aircraft
            ?from - city
            ?to - city
        )
        :duration (= ?duration (/ (distance ?city1 ?city2) (speed ?aircraft)))
        :condition (and (at start
            (at ?aircraft ?city1)
        ))
        :effect (and 
            (at start 
                (not (at ?aircraft ?city1))
            )
            (at end
                (at ?aircraft ?city2)
            )
        )
    )
)