
(define (domain train)

  (:requirements 
    :strips 
    :fluents 
    :durative-actions 
    :timed-initial-literals 
    :typing 
    :conditional-effects 
    :negative-preconditions 
    :equality
  )

  (:types
    train
    worker
    station
    building
    stronghold - building
    mine - building
  )

  ;(:constants )

  (:predicates
    (atWorker ?worker - worker ?where - (either station train))
    (atTrain ?train - train ?station - station)
    (connected ?from - station ?to - station)
    (atStation ?building - building ?station - station)
  )

  (:functions
    (gold)
    (baseTrainTime)
    (averageWorkerWeight)
    (workersAtTrain ?train - train)
    (embarkTime)
    (disembarkTime)
    (goldAtTrain ?train - train)
  )

  (:durative-action moveTrain
    :parameters (
      ?from - station
      ?to - station
      ?train - train
    )
    :duration (= ?duration (+ 0.001 (* (baseTrainTime) 
      (+
        (+ (* (averageWorkerWeight) (workersAtTrain ?train)) (goldAtTrain ?train))
        (+ (* (averageWorkerWeight) (workersAtTrain ?train)) (goldAtTrain ?train))
      )))
    )
    :condition (and 
      (at start (atTrain ?train ?from))
      (over all (connected ?from ?to))
    )
    :effect (and 
      (at start (not (atTrain ?train ?from)))
      (at end (atTrain ?train ?to))
    )
  )

  (:durative-action embark
    :parameters (
      ?train - train
      ?station - station
      ?worker - worker
    )
    :duration (= ?duration (embarkTime))
    :condition (and 
      (at start (atWorker ?worker ?station))
      (over all (atTrain ?train ?station))
    )
    :effect (and 
      (at start (not (atWorker ?worker ?station)))
      (at end (atWorker ?worker ?train))
      (at end (increase (workersAtTrain ?train) 1))
    )
  )

  (:durative-action disembark
    :parameters (
      ?train - train
      ?station - station
      ?worker - worker
    )
    :duration (= ?duration (disembarkTime))
    :condition (and 
      (at start (atWorker ?worker ?train))
      (over all (atTrain ?train ?station))
    )
    :effect (and 
      (at start (not (atWorker ?worker ?train)))
      (at end (atWorker ?worker ?station))
      (at end (decrease (workersAtTrain ?train) 1))
    )
  )
  
  (:durative-action loadGold
    :parameters (
      ?train - train
      ?station - station
      ?mine - mine
    )
    :duration (= ?duration 1000)
    :condition (and 
      (over all (atTrain ?train ?station))
      (over all (atStation ?mine ?station))
      (over all (> (workersAtTrain ?train) 0))
    )
    :effect (and 
      (at end (increase (goldAtTrain ?train) 1))
    )
  )
  
  (:durative-action unLoadGold
    :parameters (
      ?train - train
      ?station - station
      ?stronghold - stronghold
    )
    :duration (= ?duration 1000)
    :condition (and 
      (over all (atTrain ?train ?station))
      (over all (atStation ?stronghold ?station))
      (over all (> (workersAtTrain ?train) 0))
      (over all (> (goldAtTrain ?train) 0))
    )
    :effect (and 
      (at end (decrease (goldAtTrain ?train) 1))
      (at end (increase (gold) 1))
    )
  )

)