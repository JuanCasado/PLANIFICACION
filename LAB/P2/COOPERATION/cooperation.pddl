
(define (domain cooperation)

  (:requirements 
    :strips 
    :fluents 
    :durative-actions 
    :timed-initial-literals 
    :typing 
    :conditional-effects 
    :equality
    :adl
    :disjunctive-preconditions
    :equality
    :constraints
    :preferences
  )

  (:types
    located
    chargeBase - located
    vehicle - located
    UAV UGV - vehicle
    vehicleState
    navigationMode
    location
    groundLocation - location
    X - groundLocation
    Y - groundLocation
    cameraLocation - location
    pan - cameraLocation
    til - cameraLocation
    instrument - located
    camera - instrument
    chargeBaseAction
    direction
    pictureState
  )

  (:constants 
    DOCK UNDOCK - chargeBaseAction
    TAKEN SENT - pictureState
  )

  (:predicates
    (chargeBaseState ?vehicle - vehicle ?chargeBaseAction - chargeBaseAction)
    (connected ?direction - direction ?from - location ?to - location)
    (at ?located - located ?location1 - (either X pan) ?location2 - (either Y til))
    (in ?navigationMode - navigationMode ?vehicle - vehicle)
    (has ?instrument - instrument ?vehicle - vehicle)
    (picture ?X - X ?Y - Y ?pan - pan ?til - til ?sate - pictureState)
    (pictureVehicle ?X - X ?Y - Y ?pan - pan ?til - til ?vehicle - vehicle)
  )


  (:functions
    (sendPicturesTime)
    (sendPicturesBattery)
    (takePictureTime)
    (takePictureBattery)
    (chargeBaseActionTime)
    (chargeBaseActionBattery)
    (navigationModeTime)
    (navigationModeBattery)
    (orientationTime)
    (orientationBattery)
    (speed ?vehicle - vehicle ?navigationMode - navigationMode)
    (currentCharge ?vehicle - vehicle)
    (maxCharge ?vehicle - vehicle)
    (distance ?from - location ?to - location)
    (dischargeRate ?vehicle - vehicle ?navigationMode - navigationMode)
    (chargeRate ?vehicle - vehicle)
    (totalTime)
    (totalBattery)
  )

  (:constraints (and
    (forall (?vehicle - vehicle) (always (> (currentCharge ?vehicle) 0)))
  ))

  (:durative-action charge_base_action
    :parameters (
      ?vehicle - vehicle
      ?chargeBase - chargeBase
      ?currentChargeBaseAction - chargeBaseAction
      ?nextChargeBaseAction - chargeBaseAction
      ?X - X
      ?Y - Y
    )
    :duration (= ?duration (chargeBaseActionTime))
    :condition (and
      (at start (chargeBaseState ?vehicle ?currentChargeBaseAction))
      (over all (at ?chargeBase ?X ?Y))
      (over all (at ?vehicle ?X ?Y))
    )
    :effect (and 
      (at start (not (chargeBaseState ?vehicle ?currentChargeBaseAction)))
      (at end (chargeBaseState ?vehicle ?nextChargeBaseAction))
      (at end (increase (totalTime) (chargeBaseActionTime)))
      (at end (decrease (currentCharge ?vehicle) (chargeBaseActionBattery)))
      (at end (increase (totalBattery) (chargeBaseActionBattery)))
    )
  )

  (:durative-action charge
    :parameters (
      ?vehicle - vehicle
    )
    :duration (= ?duration (* (- (maxCharge ?vehicle) (currentCharge ?vehicle)) (chargeRate ?vehicle)))
    :condition (and 
      (over all (chargeBaseState ?vehicle DOCK))
    )
    :effect (and 
      (at end (assign (currentCharge ?vehicle) (maxCharge ?vehicle)))
      (at end (increase (totalTime) (* (- (maxCharge ?vehicle) (currentCharge ?vehicle)) (chargeRate ?vehicle))))
    )
  )
  

  (:durative-action pictureAction
    :parameters (
      ?vehicle - vehicle
      ?camera - camera
      ?X - X 
      ?Y - Y 
      ?pan - pan 
      ?til - til
    )
    :duration (= ?duration (takePictureTime))
    :condition (and
      (over all (has ?camera ?vehicle))
      (over all (at ?vehicle ?X ?y))
      (over all (at ?camera ?pan ?til))
    )
    :effect (and 
      (at end (picture ?X ?Y ?pan ?til TAKEN))
      (at end (pictureVehicle ?X ?Y ?pan ?til ?vehicle))
      (at end (increase (totalTime) (takePictureTime)))
      (at end (decrease (currentCharge ?vehicle) (takePictureBattery)))
      (at end (increase (totalBattery) (takePictureBattery)))
    )
  )

  (:durative-action sendPictures
    :parameters (
      ?vehicle - vehicle
      ?camera - camera
      ?X - X 
      ?Y - Y 
      ?pan - pan 
      ?til - til
    )
    :duration (= ?duration (sendPicturesTime))
    :condition (and
      (over all (has ?camera ?vehicle))
      (over all (at ?vehicle ?X ?Y))
      (over all (at ?camera ?pan ?til))
      (at start (picture ?X ?Y ?pan ?til TAKEN))
      (at start (pictureVehicle ?X ?Y ?pan ?til ?vehicle))
    )
    :effect (and 
      (at start (not (picture ?X ?Y ?pan ?til TAKEN)))
      (at start (not (pictureVehicle ?X ?Y ?pan ?til ?vehicle)))
      (at end (picture ?X ?Y ?pan ?til SENT))
      (at end (increase (totalTime) (sendPicturesTime)))
      (at end (decrease (currentCharge ?vehicle) (sendPicturesBattery)))
      (at end (increase (totalBattery) (sendPicturesBattery)))
    )
  )
  

  (:durative-action move
    :parameters (
      ?vehicle - vehicle
      ?navigationMode - navigationMode
      ?directionX - direction
      ?fromX - X
      ?toX - X
      ?directionY - direction
      ?fromY - Y
      ?toY - Y
    )
    :duration (= ?duration (+(/ (+ (* (distance ?fromX ?toX)(distance ?fromX ?toX)) (* (distance ?fromX ?toX)(distance ?fromX ?toX))) (speed ?vehicle ?navigationMode))0.01))
    :condition (and 
      (at start (at ?vehicle ?fromX ?fromY))
      (over all (in ?navigationMode ?vehicle))
      (over all (chargeBaseState ?vehicle UNDOCK))
      (over all (or (connected ?directionX ?fromX ?toX) (connected ?directionY ?fromY ?toY)))
    )
    :effect (and 
      (at start (not (at ?vehicle ?fromX ?fromY)))
      (at end (at ?vehicle ?toX ?toY))
      (at end (increase (totalTime) (+(/ (+ (* (distance ?fromX ?toX)(distance ?fromX ?toX)) (* (distance ?fromX ?toX)(distance ?fromX ?toX))) (speed ?vehicle ?navigationMode))0.01)))
      (at end (decrease (currentCharge ?vehicle) (* (+ (* (distance ?fromX ?toX)(distance ?fromX ?toX)) (* (distance ?fromX ?toX)(distance ?fromX ?toX))) (dischargeRate ?vehicle ?navigationMode))))
      (at end (increase (totalBattery) (* (+ (* (distance ?fromX ?toX)(distance ?fromX ?toX)) (* (distance ?fromX ?toX)(distance ?fromX ?toX))) (dischargeRate ?vehicle ?navigationMode))))
    )
  )
  
  (:durative-action navigation_mode_action
    :parameters (
      ?vehicle - vehicle
      ?from - navigationMode
      ?to - navigationMode
    )
    :duration (= ?duration (navigationModeTime))
    :condition (and 
      (at start (in ?from ?vehicle))
    )
    :effect (and 
      (at start (not (in ?from ?vehicle)))
      (at end (in ?to ?vehicle))
      (at end (increase (totalTime) (navigationModeTime)))
      (at end (decrease (currentCharge ?vehicle) (navigationModeBattery)))
      (at end (increase (totalBattery) (navigationModeBattery)))
    )
  )

  (:durative-action orientate
    :parameters (
      ?camera - camera
      ?vehicle - vehicle
      ?directionP - direction
      ?fromP - pan
      ?toP - pan
      ?directionT - direction
      ?fromT - til
      ?toT - til
    )
    :duration (= ?duration (orientationTime))
    :condition (and 
      (at start (at ?camera ?fromP ?fromT))
      (over all (has ?camera ?vehicle))
      (over all (or (connected ?directionP ?fromP ?toP) (connected ?directionT ?fromT ?toT)))
    )
    :effect (and 
      (at start (not (at ?camera ?fromP ?fromT)))
      (at end (at ?camera ?toP ?toT))
      (at end (increase (totalTime) (orientationTime)))
      (at end (decrease (currentCharge ?vehicle) (orientationBattery)))
      (at end (increase (totalBattery) (orientationBattery)))
    )
  )
  

)