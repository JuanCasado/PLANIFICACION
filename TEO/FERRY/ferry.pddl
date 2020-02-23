(define (domain ferry)
    (:requirements
        :durative-actions
        :equality
        :negative-preconditions
        :numeric-fluents
        :object-fluents
        :typing
    )
    (:types 
        car 
        place 
        ferry
    )

    (:predicates 
        (at-ferry ?place - place)
        (at ?car - car ?location - (either place ferry))
        (empty-ferry)
    )

    (:action sail
        :parameters (?from ?to - place)
        :precondition (and 
            (at-ferry ?from)
            (not (=?x ?to))
        )
        :effect (and 
            (at-ferry ?to)
            (not (at-ferry ?from))
        )
    )
    
    (:action board
        :parameters (?car - car ?ferry - ferry ?place - place)
        :precondition (and 
            (at-ferry ?place)
            (at ?car ?place)
            (empty-ferry)
        )
        :effect (and
            (not(at ?car ?place))
            (at ?car ?ferry)
            (not (empty-ferry))
        )
    )
    
    (:action disembark
        :parameters (?car - car ?ferry - ferry ?place - place)
        :precondition (and
            (not (empty-ferry))
            (at-ferry ?place)
            (at ?car ?ferry)
        )
        :effect (and 
            (empty-ferry)
            (at ?car ?place)
            (not(at ?car ?ferry))
        )
    )
)