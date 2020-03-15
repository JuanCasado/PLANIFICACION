(define (problem probPlanetary) (:domain planetary)
  (:objects 
    ROBOT0 ROBOT1 - robot
    LOCATION0 LOCATION1 LOCATION2 LOCATION3 LOCATION4 LOCATION5 - location
    FAST SLOW - speedType
    DRILL TAKE_PHOTO - taskType
  )

  (:init
    (= (totalTime) 0) (= (totalBattery) 0) (= (totalDistance) 0) (= (recharges) 0)

    (at ROBOT0 LOCATION0)
    (= (speed ROBOT0 SLOW) 0.5) (= (speed ROBOT0 FAST) 0.8)
    (= (moveBurn ROBOT0 SLOW) 30) (= (moveBurn ROBOT0 FAST) 40)
    (= (battery ROBOT0) 50) (= (maxBattery ROBOT0) 100) (= (minBattery ROBOT0) 20) (= (rechargeRate ROBOT0) 0.01)
    (= (taskDuration ROBOT0 DRILL) 10) (= (taskDuration ROBOT0 TAKE_PHOTO) 20)
    (= (taskBurn ROBOT0 DRILL) 40) (= (taskBurn ROBOT0 TAKE_PHOTO) 10)
    
    (at ROBOT1 LOCATION1)
    (= (speed ROBOT1 SLOW) 0.5) (= (speed ROBOT1 FAST) 0.8)
    (= (moveBurn ROBOT1 SLOW) 30) (= (moveBurn ROBOT1 FAST) 40)
    (= (battery ROBOT1) 50) (= (maxBattery ROBOT1) 100) (= (minBattery ROBOT1) 20) (= (rechargeRate ROBOT1) 0.01)
    (= (taskDuration ROBOT1 DRILL) 10) (= (taskDuration ROBOT1 TAKE_PHOTO) 20)
    (= (taskBurn ROBOT1 DRILL) 40) (= (taskBurn ROBOT1 TAKE_PHOTO) 10)

    (= (distance LOCATION0 LOCATION0) 0) (= (distance LOCATION1 LOCATION0) 2) (= (distance LOCATION2 LOCATION0) 2) (= (distance LOCATION3 LOCATION0) 2) (= (distance LOCATION4 LOCATION0) 2) (= (distance LOCATION5 LOCATION0) 2)
    (= (distance LOCATION0 LOCATION1) 2) (= (distance LOCATION1 LOCATION1) 0) (= (distance LOCATION2 LOCATION1) 2) (= (distance LOCATION3 LOCATION1) 2) (= (distance LOCATION4 LOCATION1) 2) (= (distance LOCATION5 LOCATION1) 2)
    (= (distance LOCATION0 LOCATION2) 2) (= (distance LOCATION1 LOCATION2) 2) (= (distance LOCATION2 LOCATION2) 0) (= (distance LOCATION3 LOCATION2) 2) (= (distance LOCATION4 LOCATION2) 2) (= (distance LOCATION5 LOCATION2) 2)
    (= (distance LOCATION0 LOCATION3) 2) (= (distance LOCATION1 LOCATION3) 2) (= (distance LOCATION2 LOCATION3) 2) (= (distance LOCATION3 LOCATION3) 0) (= (distance LOCATION4 LOCATION3) 2) (= (distance LOCATION5 LOCATION3) 2)
    (= (distance LOCATION0 LOCATION4) 2) (= (distance LOCATION1 LOCATION4) 2) (= (distance LOCATION2 LOCATION4) 2) (= (distance LOCATION3 LOCATION4) 2) (= (distance LOCATION4 LOCATION4) 0) (= (distance LOCATION5 LOCATION4) 2)
    (= (distance LOCATION0 LOCATION5) 2) (= (distance LOCATION1 LOCATION5) 2) (= (distance LOCATION2 LOCATION5) 2) (= (distance LOCATION3 LOCATION5) 2) (= (distance LOCATION4 LOCATION5) 2) (= (distance LOCATION5 LOCATION5) 0)

    (connected LOCATION0 LOCATION1) (connected LOCATION1 LOCATION0)
    (connected LOCATION1 LOCATION2) (connected LOCATION2 LOCATION1)
    (connected LOCATION1 LOCATION3) (connected LOCATION3 LOCATION1)
    (connected LOCATION2 LOCATION4) (connected LOCATION4 LOCATION2)
    (connected LOCATION3 LOCATION4) (connected LOCATION4 LOCATION3)
    (connected LOCATION4 LOCATION5) (connected LOCATION5 LOCATION4)

    (= (tasks LOCATION0 DRILL) 0) (= (tasks LOCATION0 TAKE_PHOTO) 0)
    (= (tasks LOCATION1 DRILL) 0) (= (tasks LOCATION1 TAKE_PHOTO) 0)
    (= (tasks LOCATION2 DRILL) 0) (= (tasks LOCATION2 TAKE_PHOTO) 0)
    (= (tasks LOCATION3 DRILL) 0) (= (tasks LOCATION3 TAKE_PHOTO) 0)
    (= (tasks LOCATION4 DRILL) 0) (= (tasks LOCATION4 TAKE_PHOTO) 0)
    (= (tasks LOCATION5 DRILL) 0) (= (tasks LOCATION5 TAKE_PHOTO) 0)
  )

  (:goal (and
    (= (tasks LOCATION2 DRILL) 3)
    (= (tasks LOCATION5 DRILL) 2)
    (= (tasks LOCATION1 TAKE_PHOTO) 2)
    (= (tasks LOCATION0 TAKE_PHOTO) 4)
  ))

  (:metric minimize (totalBattery))
)
