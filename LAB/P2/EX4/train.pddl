
(define (domain domain_name)

  (:requirements 
    :strips 
    :fluents 
    :durative-actions 
    :timed-initial-literals 
    :typing 
    :conditional-effects 
    :negative-preconditions 
    :duration-inequalities 
    :equality
  )

  (:types
    train
    station
    person
    worker - person
    conductor - worker
    revisor - worker
    passenger - person
  )

  ;(:constants )

  (:predicates
    (atPerson ?person - person ?where - (either station train))
    (atTrain ?train - train ?station - station)
  )

  (:functions

  )

  (:durative-action moveTrain
    :parameters (
      ?train - train
      ?conductor - conductor
      ?from - station
      ?to - station
    )
    :duration (= ?duration 100)
    :condition (and 
      (at start (atTrain ?train ?from))
      (over all (atPerson ?conductor ?train))
    )
    :effect (and 
      (at start (not (atTrain ?train ?from)))
      (at end (atTrain ?train ?to))
    )
  )

  (:durative-action boardWorker
    :parameters (
      ?train - train
      ?passenger - worker
      ?station - station 
    )
    :duration (= ?duration 1)
    :condition (and 
      (at start (atPerson ?passenger ?station))
      (over all (atTrain ?train ?station))
    )
    :effect (and 
      (at start (not(atPerson ?passenger ?station)))
      (at end (atPerson ?passenger ?train))
    )
  )

  (:durative-action boardPassenger
    :parameters (
      ?train - train
      ?revisor - revisor
      ?passenger - passenger
      ?station - station 
    )
    :duration (= ?duration 1)
    :condition (and 
      (at start (atPerson ?passenger ?station))
      (over all (atTrain ?train ?station))
      (over all (atPerson ?revisor ?train))
    )
    :effect (and 
      (at start (not(atPerson ?passenger ?station)))
      (at end (atPerson ?passenger ?train))
    )
  )

  (:durative-action disembarkWorker
    :parameters (
      ?train - train
      ?passenger - worker
      ?station - station 
    )
    :duration (= ?duration 1)
    :condition (and 
      (at start (atPerson ?passenger ?train))
      (over all (atTrain ?train ?station))
    )
    :effect (and 
      (at start (not(atPerson ?passenger ?train)))
      (at end (atPerson ?passenger ?station))
    )
  )

  (:durative-action disembarkPerson
    :parameters (
      ?train - train
      ?revisor - revisor
      ?passenger - passenger
      ?station - station 
    )
    :duration (= ?duration 1)
    :condition (and 
      (at start (atPerson ?passenger ?train))
      (over all (atTrain ?train ?station))
      (over all (atPerson ?revisor ?train))
    )
    :effect (and 
      (at start (not(atPerson ?passenger ?train)))
      (at end (atPerson ?passenger ?station))
    )
  )

)