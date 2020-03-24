
(define (problem probTrain) (:domain train)
  (:objects 
    T0 T1 - train
    S0 S1 S2 S3 S4 S5 - station
    P0 P1 P2 P3 P4 P5 P6 P7 P8 P9 - passenger
    C0 C1 C2 - conductor
    R0 R1 R2 - revisor
  )

  (:init
    (atTrain T0 S0)
    (atTrain T1 S1)

    (atPerson C0 S0) (atPerson C1 S1) (atPerson C2 S2)

    (atPerson R0 S3) (atPerson R0 S4) (atPerson R0 S5)
    (atPerson P0 S4) (atPerson P1 S4) (atPerson P2 S4)
    (atPerson P3 S4) (atPerson P4 S4) (atPerson P5 S4)
    (atPerson P5 S5) (atPerson P6 S5) (atPerson P7 S5)
    (atPerson P8 S1) 
    (atPerson P9 S2)
  )

  (:goal (and
    (atPerson P0 S0) (atPerson P1 S0) (atPerson P2 S0)
    (atPerson P3 S0) (atPerson P4 S0) (atPerson P5 S0)
    (atPerson P5 S0) (atPerson P6 S0) (atPerson P7 S0)
    (atPerson P8 S0) (atPerson P9 S0)
  ))

  ;(:metric minimize (???))
)
