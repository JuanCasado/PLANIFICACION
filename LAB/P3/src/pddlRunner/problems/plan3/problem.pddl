(define (problem probPlanetary) (:domain planetary) (:objects
 robot1 - robot
 LOCATION0 LOCATION1 - location
 FAST - speedType
 task1 - taskType
)
(:init (= (totalTime) 0) (= (totalBattery) 0) (= (totalDistance) 0) (= (recharges) 0)
 (at robot1 LOCATION1)
(= (speed robot1 FAST) 40)(= (moveBurn robot1 FAST) 1)
(= (battery robot1) 100) (= (maxBattery robot1) 200) (= (rechargeRate robot1) 1)
(= (taskDuration robot1 task1) 20) (= (taskBurn robot1 task1) 1)


 (= (tasks LOCATION0 task1) 0)(= (tasks LOCATION1 task1) 0)

  (= (distance LOCATION0 LOCATION1) 327) (= (distance LOCATION1 LOCATION0) 327) 

 (connected LOCATION1 LOCATION0) (connected LOCATION0 LOCATION1)

)(:goal (and
 (= (tasks LOCATION0 task1) 1)
))
 (:metric minimize (totalTime))
)
