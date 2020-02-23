(define (domain hanoiExtended)
    (:requirements :strips :typing)
    (:types disk peg)
    (:predicates 
        (at ?x - disk ?y - (either disk peg))
        (clear ?x - (either disk peg))
        (smaller ?x - disk ?y - (either disk peg))
    )
    (:action move-disk
        :parameters (?disk - disk ?from - (either disk peg) ?newBelow - (either disk peg))
        :precondition (and
            (clear ?disk)
            (clear ?newBelow)
            (smaller ?disk ?newBelow)
            (at ?disk ?from)
        )
        :effect (and
            (at ?disk ?newBelow)
            (clear ?from)
            (not (clear ?newBelow))
            (not (at ?disk ?from))
        )
    )
)