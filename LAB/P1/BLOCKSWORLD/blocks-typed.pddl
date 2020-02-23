(define (domain blocks-typed)
  (:requirements :strips :typing)
  (:types block)
  (:predicates 
        (on ?x ?y)
        (ontable ?x)
        (clear ?x)
        (handempty)
        (holding ?x)
    )
  (:action pick-up
       :parameters (?x - block)
       :precondition (and 
            (clear ?x) 
            (ontable ?x) 
            (handempty)
        )
       :effect (and 
            (not (ontable ?x))
            (not (clear ?x))
            (not (handempty))
            (holding ?x)
        )
   )
  (:action unstack
       :parameters (?x  - block ?y - block)
       :precondition (and 
            (on ?x ?y) 
            (clear ?x) 
            (handempty)
        )
       :effect (and 
            (holding ?x)
            (clear ?y)
            (not (clear ?x))
            (not (handempty))
            (not (on ?x ?y))
        )
   )  
  (:action stack
       :parameters (?x - block ?y - block)
       :precondition (and 
            (holding ?x) 
            (clear ?y) 
            (not (handempty))
        )
       :effect (and 
            (not (holding ?x))
            (handempty)
            (on ?x ?y)
            (not (clear ?y))
            (clear ?x)
       )
   )
  (:action put-down
       :parameters (?x - block)
       :precondition (and 
            (holding ?x) 
            (not (handempty))
            (not (clear ?x))
        )
       :effect(and 
            (not (holding ?x))
            (handempty)
            (ontable ?x)
            (clear ?x)
       )
   )  
)