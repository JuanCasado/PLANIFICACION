(define (problem probRobot1)
  (:domain robot)
  (:objects
    ROBOT - robot
    ROOM1 - location
    ROOM2 - location
    ROOM3 - location
    ROOM4 - location
    DOOR1 - door
    DOOR2 - door
    DOOR3 - door
    DOOR4 - door
    CORRIDOR - location
    SWITCH1 - switch
    SWITCH2 - switch
    SWITCH3 - switch
    SWITCH4 - switch
    OBJ1 - box
    OBJ2 - box
  )
  (:init
    (connected DOOR1 ROOM1 CORRIDOR) (connected DOOR1 CORRIDOR ROOM1)
    (connected DOOR2 ROOM2 CORRIDOR) (connected DOOR2 CORRIDOR ROOM2)
    (connected DOOR3 ROOM3 CORRIDOR) (connected DOOR3 CORRIDOR ROOM3)
    (connected DOOR4 ROOM4 CORRIDOR) (connected DOOR4 CORRIDOR ROOM4)
    (at ROBOT ROOM1)
    (at OBJ1 ROOM1)
    (at OBJ2 ROOM1)
    (at SWITCH1 ROOM1)
    (at SWITCH2 ROOM2)
    (at SWITCH3 ROOM3)
    (at SWITCH4 ROOM4)
  )
  (:goal (and
    (powered SWITCH1)
    (powered SWITCH2)
    (powered SWITCH3)
    (powered SWITCH4)
  ))
)