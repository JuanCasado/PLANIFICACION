(define (problem probferry)
    (:domain ferry)
    (:objects 
        A B - place
        c1 c2 - car
    )
    (:init
        (at c1 A)
        (at c2 A)
        (at-ferry A)
        (empty-ferry)
    )
    (:goal (and
        (at c1 B)
        (at c2 B)
    ))
)