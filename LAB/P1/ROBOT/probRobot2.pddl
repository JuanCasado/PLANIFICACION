(define (problem probRobot2)
  (:domain robot)
  (:objects
    ROBOT1 - robot
    ROBOT2 - robot
    ROOM1 - location
    ROOM2 - location
    ROOM3 - location
    ROOM4 - location
    ROOM5 - location
    ROOM6 - location
    ROOM7 - location
    ROOM8 - location
    ROOM9 - location
    ROOM10 - location
    DOOR1 - door
    DOOR2 - door
    DOOR3 - door
    DOOR4 - door
    DOOR5 - door
    DOOR6 - door
    DOOR7 - door
    DOOR8 - door
    DOOR9 - door
    DOOR10 - door
    SWITCH1 - switch
    SWITCH2 - switch
    SWITCH3 - switch
    SWITCH4 - switch
    SWITCH5 - switch
    SWITCH6 - switch
    SWITCH7 - switch
    SWITCH8 - switch
    SWITCH9 - switch
    SWITCH10 - switch
    SWITCH11 - switch
    SWITCH12 - switch
    OBJ1 - box
    OBJ2 - box
    OBJ3 - box
    OBJ4 - box
    OBJ5 - box
  )
  (:init
    (connected DOOR1 ROOM1 ROOM5)  (connected DOOR1 ROOM5 ROOM1)
    (connected DOOR2 ROOM2 ROOM5)  (connected DOOR2 ROOM5 ROOM2)
    (connected DOOR3 ROOM3 ROOM5)  (connected DOOR3 ROOM5 ROOM3)
    (connected DOOR4 ROOM4 ROOM5)  (connected DOOR4 ROOM5 ROOM4)
    (connected DOOR5 ROOM4 ROOM10) (connected DOOR5 ROOM10 ROOM4)
    (connected DOOR6 ROOM5 ROOM6)  (connected DOOR6 ROOM6 ROOM5)
    (connected DOOR7 ROOM5 ROOM7)  (connected DOOR7 ROOM7 ROOM5)
    (connected DOOR8 ROOM5 ROOM8)  (connected DOOR8 ROOM8 ROOM5)
    (connected DOOR9 ROOM7 ROOM9)  (connected DOOR9 ROOM9 ROOM7)
    (connected DOOR10 ROOM9 ROOM10) (connected DOOR10 ROOM4 ROOM10)
    (at ROBOT1 ROOM1)
    (at ROBOT2 ROOM4)
    (at OBJ1 ROOM6)
    (at OBJ2 ROOM9)
    (at OBJ3 ROOM10)
    (at OBJ4 ROOM3)
    (at OBJ5 ROOM3)
    (at SWITCH1 ROOM1)
    (at SWITCH2 ROOM2)
    (at SWITCH3 ROOM3)
    (at SWITCH4 ROOM4)
    (at SWITCH5 ROOM5)
    (at SWITCH6 ROOM6)
    (at SWITCH7 ROOM7)
    (at SWITCH8 ROOM8)
    (at SWITCH9 ROOM9)
    (at SWITCH10 ROOM10)
    (at SWITCH11 ROOM7)
    (at SWITCH12 ROOM3)
  )
  (:goal (and
    (powered SWITCH1)
    (powered SWITCH2)
    (powered SWITCH3)
    (powered SWITCH4)
    (powered SWITCH5)
    (powered SWITCH6)
    (powered SWITCH7)
    (powered SWITCH8)
    (powered SWITCH9)
    (powered SWITCH10)
    (powered SWITCH11)
    (powered SWITCH12)
  ))
)