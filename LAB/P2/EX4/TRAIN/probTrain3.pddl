

(define (problem probTrain2) (:domain train)
  (:objects 
    T0 T1 - train
    S0 S1 S2 S3 S4 S5 - station
    STRONGHOLD0 STRONGHOLD1 - stronghold
    MINE0 MINE1 - mine
    W0 W1 W2 W3 W4 W5 W6 W7 W8 - worker
  )

  (:init
    (= (embarkTime) 2)
    (= (disembarkTime) 2)
    (= (gold) 0)
    (= (baseTrainTime) 0.001)
    (= (averageWorkerWeight) 70)

    (atTrain T0 S0) (= (workersAtTrain T0) 0) (= (goldAtTrain T0) 0)
    (atTrain T1 S1) (= (workersAtTrain T1) 0) (= (goldAtTrain T1) 0)

    (atStation STRONGHOLD0 S0)
    (atStation STRONGHOLD1 S1)
    (atStation MINE0 S4)
    (atStation MINE1 S5)

    (connected S0 S2) (connected S2 S0)
    (connected S1 S2) (connected S2 S1)
    (connected S2 S3) (connected S3 S2)
    (connected S3 S4) (connected S4 S3)
    (connected S3 S5) (connected S5 S3)

    (atWorker W0 S5) ( atWorker W1 S5) 
    (atWorker W2 S4) ( atWorker W3 S4) 
    (atWorker W4 S3) ( atWorker W5 S3)
    (atWorker W6 S2) ( atWorker W7 S2)
    (atWorker W7 S2) ( atWorker W7 S2)
    (atWorker W8 S2) ( atWorker W8 S2)
  )

  (:goal (and
    (= (gold) 5)
  ))

  (:metric minimize (total-time))
)
