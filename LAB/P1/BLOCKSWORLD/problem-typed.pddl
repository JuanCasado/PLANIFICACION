(define (problem problem-typed)
   (:domain blocks-typed)
   (:objects C D E F B I J A N O K M P H G L Q - block)
   (:init 
        (ontable C) (ontable D) (ontable E) (ontable F) (ontable B) (ontable I) (ontable J) (ontable A) (ontable N) (ontable O) (ontable K) (ontable M) (ontable P) (ontable H) (ontable G) (ontable L) (ontable Q)
        (clear C) (clear D) (clear E) (clear F) (clear B) (clear I) (clear J) (clear A) (clear N) (clear O) (clear K) (clear M) (clear P) (clear H) (clear G) (clear L) (clear Q)
        (handempty)
   )
   (:goal (and 
            (on Q N) (on N L) (on L O) (on O J) (on J H) (on H C) (on C E) (on E M)
            (on M P) (on P A) (on A G) (on G B) (on B I) (on I K) (on K F) (on F D)
        )
   )
)