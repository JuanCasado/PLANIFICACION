(define (problem problem_name) (:domain domain_name)
  (:objects 
    BLUE RED SCUTTLER_NASHOR SCUTTLER_DRAKE GROMP RAPTORS WOLVES KRUG - camp
    TOP MID BOT - lane

    BASE - node
    N_BLUE N_RED N_SCUTTLER_NASHOR N_SCUTTLER_DRAKE N_GROMP N_RAPTORS N_WOLVES N_KRUG - node
    N_TOP N_MID N_BOT - node
    N1 N2 N3 N4 N5 N6 N7 N8 N9 N10 N11 N12 N13 N14 N15 N16 N17 N18 N19 - node
  )

  (:init
    (= (playerGold) 0)
    (= (playerXP) 0)
    (= (velocity) 1)

    (connected BASE N4)                (= (distance BASE N4) 20)
    (connected BASE N10)               (= (distance BASE N10) 20)
                                                                                                                          ;
    (connected N1 N_GROMP)             (= (distance N1 N_GROMP) 3)
    (connected N1 N_TOP)               (= (distance N1 N_TOP) 10)
    (connected N1 N2)                  (= (distance N1 N2) 5)
                                                                                                                          ;
    (connected N2 N1)                  (= (distance N2 N1) 5)
    (connected N2 N_BLUE)              (= (distance N2 N_BLUE) 1)
    (connected N2 N_SCUTTLER_NASHOR)   (= (distance N2 N_SCUTTLER_NASHOR) 3)
                                                                                                                          ;
    (connected N3 N_GROMP)             (= (distance N3 N_GROMP) 2)
    (connected N3 N_BLUE)              (= (distance N3 N_BLUE) 1)
    (connected N3 N4)                  (= (distance N3 N4) 2)
                                                                                                                          ;
    (connected N4 N_WOLVES)             (= (distance N4 N_WOLVES) 3)
    (connected N4 N5)                  (= (distance N4 N5) 7)
    (connected N4 BASE)                (= (distance N4 BASE) 20)
    (connected N4 N3)                  (= (distance N4 N3) 2)
                                                                                                                          ;
    (connected N5 N4)                  (= (distance N5 N4) 7)
    (connected N5 N7)                  (= (distance N5 N7) 8)
    (connected N5 N_SCUTTLER_NASHOR)   (= (distance N5 N_SCUTTLER_NASHOR) 7)
                                                                                                                          ;
    (connected N6 N_WOLVES)             (= (distance N6 N_WOLVES) 7)
    (connected N6 N7)                  (= (distance N6 N7) 5)
    (connected N6 N8)                  (= (distance N6 N8) 3)
                                                                                                                          ;
    (connected N7 N5)                  (= (distance N7 N5) 8)
    (connected N7 N6)                  (= (distance N7 N6) 5)
    (connected N7 N_MID)               (= (distance N7 N_MID) 2)
                                                                                                                          ;
    (connected N8 N6)                  (= (distance N8 N6) 3)
    (connected N8 N10)                 (= (distance N8 N10) 4)
    (connected N8 N_RAPTORS)           (= (distance N8 N_RAPTORS) 1)
    (connected N8 N_RED)               (= (distance N8 N_RED) 6)
                                                                                                                          ;
    (connected N9 N12)                  (= (distance N9 N12) 5)
    (connected N9 N_RAPTORS)            (= (distance N9 N_RAPTORS) 5)
    (connected N9 N_MID)                (= (distance N9 N_MID) 6)
    (connected N9 N_SCUTTLER_DRAKE)     (= (distance N9 N_SCUTTLER_DRAKE) 5)
                                                                                                                          ;
    (connected N10 N8)                  (= (distance N10 N8) 4)
    (connected N10 BASE)                (= (distance N10 BASE) 20)
    (connected N10 N11)                 (= (distance N10 N11) 3)
                                                                                                                          ;
    (connected N11 N10)                 (= (distance N11 N10)3)
    (connected N11 N_RED)               (= (distance N11 N_RED) 3)
    (connected N11 N_KRUG)              (= (distance N11 N_KRUG) 4)
                                                                                                                          ;
    (connected N12 N_RED)               (= (distance N12 N_RED) 4)
    (connected N12 N9)                  (= (distance N12 N9) 5)
    (connected N12 N13)                 (= (distance N12 N13) 4)
                                                                                                                          ;
    (connected N13 N12)                 (= (distance N13 N12) 4)
    (connected N13 N14)                 (= (distance N13 N14) 2)
    (connected N13 N_KRUG)              (= (distance N13 N_KRUG) 7)
                                                                                                                          ;
    (connected N14 N13)                 (= (distance N14 N13) 2)
    (connected N14 N_BOT)               (= (distance N14 N_BOT) 4)
    (connected N14 N_SCUTTLER_DRAKE)    (= (distance N14 N_SCUTTLER_DRAKE) 4)
                                                                                                                          ;
    (connected N_BLUE N3)               (= (distance N_BLUE N3) 1)
    (connected N_BLUE N2)               (= (distance N_BLUE N2) 1)
                                                                                                                          ;
    (connected N_RED  N8)                (= (distance N_RED  N8) 6)
    (connected N_RED  N12)               (= (distance N_RED  N12) 4)
    (connected N_RED  N11)               (= (distance N_RED  N11) 3)
                                                                                                                          ;
    (connected N_SCUTTLER_NASHOR N_TOP) (= (distance N_SCUTTLER_NASHOR N_TOP) 10)
    (connected N_SCUTTLER_NASHOR N_MID) (= (distance N_SCUTTLER_NASHOR N_MID) 10)
    (connected N_SCUTTLER_NASHOR N2)    (= (distance N_SCUTTLER_NASHOR N2) 3)
    (connected N_SCUTTLER_NASHOR N5)    (= (distance N_SCUTTLER_NASHOR N5) 7)
                                                                                                                          ;
    (connected N_SCUTTLER_DRAKE N9)     (= (distance N_SCUTTLER_DRAKE N9) 5)
    (connected N_SCUTTLER_DRAKE N14)    (= (distance N_SCUTTLER_DRAKE N14) 4)
                                                                                                                          ;
    (connected N_GROMP N1)              (= (distance N_GROMP N1) 3)
    (connected N_GROMP N3)              (= (distance N_GROMP N3) 2)
                                                                                                                          ;
    (connected N_RAPTORS N8)            (= (distance N_RAPTORS N8) 1)
    (connected N_RAPTORS N9)            (= (distance N_RAPTORS N9) 5)
                                                                                                                          ;
    (connected N_WOLVES N4)             (= (distance N_WOLVES N4) 3)
    (connected N_WOLVES N6)             (= (distance N_WOLVES N6) 7)
                                                                                                                              ;
    (connected N_KRUG N11)              (= (distance N_KRUG N11) 4)
    (connected N_KRUG N13)              (= (distance N_KRUG N13) 7)
                                                                                                                              ;
    (connected N_TOP N1)                (= (distance N_TOP N1) 10)
    (connected N_TOP N_SCUTTLER_NASHOR) (= (distance N_TOP N_SCUTTLER_NASHOR) 10)
                                                                                                                              ;
    (connected N_MID N_SCUTTLER_NASHOR) (= (distance N_MID N_SCUTTLER_NASHOR) 10)
    (connected N_MID N7)                (= (distance N_MID N7) 2)
    (connected N_MID N9)                (= (distance N_MID N9) 6)
                                                                                                                              ;
    (connected N_BOT N14)               (= (distance N_BOT N14) 4)
                                                                                                                          ;

    (has N_BLUE BLUE)
    (has N_RED RED)
    (has N_SCUTTLER_NASHOR SCUTTLER_NASHOR)
    (has N_SCUTTLER_DRAKE SCUTTLER_DRAKE)
    (has N_GROMP GROMP)
    (has N_RAPTORS RAPTORS)
    (has N_WOLVES WOLVES)
    (has N_KRUG KRUG)
    (has N_TOP TOP)
    (has N_MID MID)
    (has N_BOT BOT)

    (up BLUE)            (= (timeToDo BLUE) 15)
    (up RED)             (= (timeToDo RED) 15)
    (up SCUTTLER_NASHOR) (= (timeToDo SCUTTLER_NASHOR) 17)
    (up SCUTTLER_DRAKE)  (= (timeToDo SCUTTLER_DRAKE) 17)
    (up GROMP)           (= (timeToDo GROMP) 12)
    (up RAPTORS)         (= (timeToDo RAPTORS) 10)
    (up WOLVES)          (= (timeToDo WOLVES) 10)
    (up KRUG)            (= (timeToDo KRUG) 20)

    (= (gold BLUE) 100)
    (= (gold RED) 100)
    (= (gold SCUTTLER_NASHOR) 150)
    (= (gold SCUTTLER_DRAKE) 150)
    (= (gold GROMP) 105)
    (= (gold RAPTORS) 45)
    (= (gold WOLVES) 55)
    (= (gold KRUG) 42)

    (= (xp BLUE) 110)
    (= (xp RED) 110)
    (= (xp SCUTTLER_NASHOR) 115)
    (= (xp SCUTTLER_DRAKE) 115)
    (= (xp GROMP) 135)
    (= (xp RAPTORS) 45)
    (= (xp WOLVES) 65)
    (= (xp KRUG) 37)

    (not (ganked))
    (at BASE)

    (= (campsDone) 0)
    (= (campsToDoBeforeGank) 0)
  )

  (:goal (and
    (= (campsDone) 4)
    (gankedlane TOP)
    (gankedlane BOT)
  ))

  (:metric maximize (+
    (* (playerGold) 0.5)
    (* (playerXP) 0.5)
  ))
  (:metric minimize total-time)
)
