(define (problem problem2)
   (:domain blocks)
   (:objects blockA blockB blockC)
   (:init 
        (clear blockC) (clear blockB) (ontable blockA) (ontable blockB) (on blockC blockA)
        (handempty)
   )
   (:goal (and 
        (on blockA blockB)
        (on blockB blockC)
        (ontable blockC)
        )
   )
)