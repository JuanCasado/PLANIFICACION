
(define (domain planetary)

  (:requirements 
    :strips 
    :fluents 
    :durative-actions 
    :timed-initial-literals 
    :typing 
    :conditional-effects 
    :negative-preconditions 
    :equality
    :constraints
    :preferences
  )

  (:types
    robot
    location
    speedType
    taskType
  )

  ;(:constraints (and
  ;  (forall (?robot - robot) (always 
  ;    (> (battery ?robot) (minBattery ?robot))
  ;  ))
  ;))

  (:predicates
    (at ?robot - robot ?location - location)
    (connected ?from - location ?to - location)
    (moving ?robot)
  )


  (:functions
    (distance ?from - location ?to - location)
    (speed ?robot - robot ?speedType - speedType)
    (battery ?robot - robot)
    (moveBurn ?robot - robot ?speedType - speedType)
    (taskBurn ?robot - robot ?taskType - taskType)
    (maxBattery ?robot - robot)
    (minBattery ?robot - robot)
    (rechargeRate ?robot - robot)
    (tasks ?location - location ?taskType - taskType)
    (taskDuration ?robot - robot ?taskType - taskType)
    (totalTime)
    (totalBattery)
    (totalDistance)
    (recharges)
  )

  (:durative-action move
    :parameters (
      ?robot - robot
      ?from - location
      ?to - location
      ?speedType - speedType
    )
    :duration (= ?duration (/(distance ?from ?to) (speed ?robot ?speedType)))
    :condition (and 
      (at start (at ?robot ?from))
      (at start (> (battery ?robot) (* (distance ?from ?to) (moveBurn ?robot ?speedType))))
      (over all (not (= ?from ?to)))
      (over all (connected ?from ?to))
      (over all (> (battery ?robot) (minBattery ?robot)))
    )
    :effect (and 
      (at start (not (at ?robot ?from)))
      (at start (moving ?robot))
      (at end (at ?robot ?to))
      (at end (not (moving ?robot)))
      (at end (decrease (battery ?robot) (* (distance ?from ?to) (moveBurn ?robot ?speedType))))
      (at end (increase (totalBattery) (* (distance ?from ?to) (moveBurn ?robot ?speedType))))
      (at end (increase (totalTime) (/ (distance ?from ?to) (speed ?robot ?speedType))))
      (at end (increase (totalDistance) (distance ?from ?to)))
    )
  )

  (:durative-action recharge
    :parameters (
      ?robot - robot
      ?location - location
    )
    :duration (= ?duration (* (- (maxBattery ?robot) (battery ?robot)) (rechargeRate ?robot)))
    :condition (and
      (at start (< (battery ?robot) (maxBattery ?robot)))
      (over all (at ?robot ?location))
      (over all (not (moving ?robot)))
    )
    :effect (and 
      (at end (assign (battery ?robot) (maxBattery ?robot)))
      (at end (increase (totalTime) (* (- (maxBattery ?robot) (battery ?robot)) (rechargeRate ?robot))))
      (at end (increase (recharges) 1))
    )
  )
  
  
  (:durative-action performTask
    :parameters (
      ?robot - robot
      ?location - location
      ?taskType - taskType
    )
    :duration (= ?duration (taskDuration ?robot ?taskType))
    :condition (and
      (at start (> (battery ?robot) (taskBurn ?robot ?taskType)))
      (over all (not (moving ?robot)))
      (over all (at ?robot ?location))
    )
    :effect (and 
      (at end (increase (tasks ?location ?taskType) 1))
      (at end (decrease (battery ?robot) (taskBurn ?robot ?taskType)))
      (at end (increase (totalBattery) (taskBurn ?robot ?taskType)))
      (at end (increase (totalTime) (taskDuration ?robot ?taskType)))
    )
  )

)