(define (problem probCooperation) (:domain cooperation)
  (:objects 
    LEADER - UAV
    FOLLOWER - UGV
    CHARGE_BASE_1 CHARGE_BASE_2 - chargeBase
    CAMERA_1 CAMERA_2 - camera
    
    ;    X0 X1 X2 X3 X4 X5 X6 X7 X8 X9 X10 X11 X12 X13 x14 X15 X16 X17 X18 X19 - X
    ;Y0                                                                        - Y
    ;Y1                                                                        - Y
    ;Y2                                                                        - Y
    ;Y3                                                                        - Y
    ;Y4                                                                        - Y
    ;Y5                                                                        - Y
    ;Y6                                                                        - Y
    ;Y7                                                                        - Y
    ;Y8                                                                        - Y
    ;Y9                                                                        - Y
    ;Y10                                                                       - Y
    ;Y11                                                                       - Y
    ;Y12                                                                       - Y
    ;Y13                                                                       - Y
    ;Y14                                                                       - Y
    ;Y15                                                                       - Y
    ;Y16                                                                       - Y
    ;Y17                                                                       - Y
    ;Y18                                                                       - Y
    ;Y19                                                                       - Y

        X5 X6 X7 X8 X9 X10 X11 X12 X13 x14 X15 X16 - X
    Y2                                             - Y
    Y3                                             - Y
    Y4                                             - Y
    Y5                                             - Y
    Y6                                             - Y
    Y7                                             - Y
    Y8                                             - Y
    Y9                                             - Y
    Y10                                            - Y
    Y11                                            - Y
    Y12                                            - Y
    Y13                                            - Y

          T_270 T_315 T_0 T_45 T_90 - til
    P_0                             - pan
    P_45                            - pan
    P_90                            - pan
    P_135                           - pan
    P_180                           - pan
    P_225                           - pan
    P_270                           - pan
    P_315                           - pan
    
    UP DOWN RIGHT LEFT SAME - direction
    FAST SLOW - navigationMode
  )

  (:init
    (= (sendPicturesTime) 10)
    (= (sendPicturesBattery) 1)
    (= (takePictureTime) 20)
    (= (takePictureBattery) 1)
    (= (chargeBaseActionTime) 20)
    (= (chargeBaseActionBattery) 1)
    (= (navigationModeTime) 1)
    (= (navigationModeBattery) 0.5)
    (= (orientationTime) 1)
    (= (orientationBattery) 1)
    (= (totalTime) 0)
    (= (totalBattery) 0)

    ;(connected UP P_0 P_45) (connected UP P_45 P_90) (connected UP P_90 P_135) (connected UP P_135 P_180) (connected UP P_180 P_225) (connected UP P_225 P_270) (connected UP P_270 P_315)
    ;(connected DOWN P_45 P_0) (connected DOWN P_90 P_45) (connected DOWN P_135 P_90) (connected DOWN P_180 P_135) (connected DOWN P_225 P_180) (connected DOWN P_270 P_225) (connected DOWN P_315 P_270)
    ;(connected SAME P_0 P_0) (connected SAME P_45 P_45) (connected SAME P_90 P_90) (connected SAME P_135 P_135) (connected SAME P_180 P_180) (connected SAME P_225 P_225) (connected SAME P_270 P_270) (connected SAME P_315 P_315)
    ;
    ;(connected RIGHT  T_270 T_315) (connected RIGHT T_315 T_0) (connected RIGHT T_0 T_45)
    ;(connected LEFT  T_315 T_270) (connected LEFT T_0 T_315) (connected LEFT T_45 T_0)
    ;(connected SAME T_0 T_0) (connected SAME T_45 T_45) (connected SAME T_90 T_90) (connected SAME T_270 T_270) (connected SAME T_315 T_315)
    ;
    ;(connected RIGHT X0 X1) (connected RIGHT X1 X2) (connected RIGHT X2 X3) (connected RIGHT X3 X4) (connected RIGHT X4 X5) (connected RIGHT X5 X6) (connected RIGHT X6 X7) (connected RIGHT X7 X8) (connected RIGHT X8 X9) (connected RIGHT X9 X10) (connected RIGHT X10 X11) (connected RIGHT X11 X12) (connected RIGHT X12 X13) (connected RIGHT X13 X14) (connected RIGHT X14 X15) (connected RIGHT X15 X16) (connected RIGHT X16 X17) (connected RIGHT X17 X18) (connected RIGHT X18 X19)
    ;(connected LEFT X1 X0) (connected LEFT X2 X1) (connected LEFT X3 X2) (connected LEFT X4 X3) (connected LEFT X5 X4) (connected LEFT X6 X5) (connected LEFT X7 X6) (connected LEFT X8 X7) (connected LEFT X9 X8) (connected LEFT X10 X9) (connected LEFT X11 X10) (connected LEFT X12 X11) (connected LEFT X13 X12) (connected LEFT X14 X13) (connected LEFT X15 X14) (connected LEFT X16 X15) (connected LEFT X17 X16) (connected LEFT X18 X17) (connected LEFT X19 X18)
    ;(connected SAME X0 X0) (connected SAME X1 X1) (connected SAME X2 X2) (connected SAME X3 X3) (connected SAME X4 X4) (connected SAME X5 X5) (connected SAME X6 X6) (connected SAME X7 X7) (connected SAME X8 X8) (connected SAME X9 X9) (connected SAME X10 X10) (connected SAME X11 X11) (connected SAME X12 X12) (connected SAME X13 X13) (connected SAME X14 X14) (connected SAME X15 X15) (connected SAME X16 X16) (connected SAME X17 X17) (connected SAME X18 X18) (connected SAME X19 X19)
    ;
    ;(connected DOWN Y0 Y1) (connected DOWN Y1 Y2) (connected DOWN Y2 Y3) (connected DOWN Y3 Y4) (connected DOWN Y4 Y5) (connected DOWN Y5 Y6) (connected DOWN Y6 Y7) (connected DOWN Y7 Y8) (connected DOWN Y8 Y9) (connected RIGHT Y9 Y10) (connected RIGHT Y10 Y11) (connected RIGHT Y11 Y12) (connected RIGHT Y12 Y13) (connected RIGHT Y13 Y14) (connected RIGHT Y14 Y15) (connected RIGHT Y15 Y16) (connected RIGHT Y16 Y17) (connected RIGHT Y17 Y18) (connected RIGHT Y18 Y19)
    ;(connected UP Y1 Y0) (connected UP Y2 Y1) (connected UP Y3 Y2) (connected UP Y4 Y3) (connected UP Y5 Y4) (connected UP Y6 Y5) (connected UP Y7 Y6) (connected UP Y8 Y7) (connected UP Y9 Y8) (connected LEFT Y10 Y9) (connected LEFT Y11 Y10) (connected LEFT Y12 Y11) (connected LEFT Y13 Y12) (connected LEFT Y14 Y13) (connected LEFT Y15 Y14) (connected LEFT Y16 Y15) (connected LEFT Y17 Y16) (connected LEFT Y18 Y17) (connected LEFT Y19 Y18)
    ;(connected SAME Y0 Y0) (connected SAME Y1 Y1) (connected SAME Y2 Y2) (connected SAME Y3 Y3) (connected SAME Y4 Y4) (connected SAME Y5 Y5) (connected SAME Y6 Y6) (connected SAME Y7 Y7) (connected SAME Y8 Y8) (connected SAME Y9 Y9) (connected SAME Y10 Y10) (connected SAME Y11 Y11) (connected SAME Y12 Y12) (connected SAME Y13 Y13) (connected SAME Y14 Y14) (connected SAME Y15 Y15) (connected SAME Y16 Y16) (connected SAME Y17 Y17) (connected SAME Y18 Y18) (connected SAME Y19 Y19)
    ;
    ;(= (distance X0 X1) 10) (= (distance X1 X2) 10) (= (distance X2 X3) 10) (= (distance X3 X4) 10) (= (distance X4 X5) 10) (= (distance X5 X6) 10) (= (distance X6 X7) 10) (= (distance X7 X8) 10) (= (distance X8 X9) 10) (= (distance X9 X10) 10) (= (distance X10 X11) 10) (= (distance X11 X12) 10) (= (distance X12 X13) 10) (= (distance X13 X14) 10) (= (distance X14 X15) 10) (= (distance X15 X16) 10) (= (distance X16 X17) 10) (= (distance X17 X18) 10) (= (distance X18 X19) 10)
    ;(= (distance X1 X0) 10) (= (distance X2 X1) 10) (= (distance X3 X2) 10) (= (distance X4 X3) 10) (= (distance X5 X4) 10) (= (distance X6 X5) 10) (= (distance X7 X6) 10) (= (distance X8 X7) 10) (= (distance X9 X8) 10) (= (distance X10 X9) 10) (= (distance X11 X10) 10) (= (distance X12 X11) 10) (= (distance X13 X12) 10) (= (distance X14 X13) 10) (= (distance X15 X14) 10) (= (distance X16 X15) 10) (= (distance X17 X16) 10) (= (distance X18 X17) 10) (= (distance X19 X18) 10)
    ;(= (distance X0 X0) 0) (= (distance X1 X1) 0) (= (distance X2 X2) 0) (= (distance X3 X3) 0) (= (distance X4 X4) 0) (= (distance X5 X5) 0) (= (distance X6 X6) 0) (= (distance X7 X7) 0) (= (distance X8 X8) 0) (= (distance X9 X9) 0) (= (distance X10 X10) 0) (= (distance X11 X11) 0) (= (distance X12 X12) 0) (= (distance X13 X13) 0) (= (distance X14 X14) 0) (= (distance X15 X15) 0) (= (distance X16 X16) 0) (= (distance X17 X17) 0) (= (distance X18 X18) 0) (= (distance X19 X19) 0)
    ;
    ;(= (distance Y0 Y1) 10) (= (distance Y1 Y2) 10) (= (distance Y2 Y3) 10) (= (distance Y3 Y4) 10) (= (distance Y4 Y5) 10) (= (distance Y5 Y6) 10) (= (distance Y6 Y7) 10) (= (distance Y7 Y8) 10) (= (distance Y8 Y9) 10) (= (distance Y9 Y10) 10) (= (distance Y10 Y11) 10) (= (distance Y11 Y12) 10) (= (distance Y12 Y13) 10) (= (distance Y13 Y14) 10) (= (distance Y14 Y15) 10) (= (distance Y15 Y16) 10) (= (distance Y16 Y17) 10) (= (distance Y17 Y18) 10) (= (distance Y18 Y19) 10)
    ;(= (distance Y1 Y0) 10) (= (distance Y2 Y1) 10) (= (distance Y3 Y2) 10) (= (distance Y4 Y3) 10) (= (distance Y5 Y4) 10) (= (distance Y6 Y5) 10) (= (distance Y7 Y6) 10) (= (distance Y8 Y7) 10) (= (distance Y9 Y8) 10) (= (distance Y10 Y9) 10) (= (distance Y11 Y10) 10) (= (distance Y12 Y11) 10) (= (distance Y13 Y12) 10) (= (distance Y14 Y13) 10) (= (distance Y15 Y14) 10) (= (distance Y16 Y15) 10) (= (distance Y17 Y16) 10) (= (distance Y18 Y17) 10) (= (distance Y19 Y18) 10)
    ;(= (distance Y0 Y0) 0) (= (distance Y1 Y1) 0) (= (distance Y2 Y2) 0) (= (distance Y3 Y3) 0) (= (distance Y4 Y4) 0) (= (distance Y5 Y5) 0) (= (distance Y6 Y6) 0) (= (distance Y7 Y7) 0) (= (distance Y8 Y8) 0) (= (distance Y9 Y9) 0) (= (distance Y10 Y10) 0) (= (distance Y11 Y11) 0) (= (distance Y12 Y12) 0) (= (distance Y13 Y13) 0) (= (distance Y14 Y14) 0) (= (distance Y15 Y15) 0) (= (distance Y16 Y16) 0) (= (distance Y17 Y17) 0) (= (distance Y18 Y18) 0) (= (distance Y19 Y19) 0)

    (connected UP P_0 P_45) (connected UP P_45 P_90) (connected UP P_90 P_135) (connected UP P_135 P_180) (connected UP P_180 P_225) (connected UP P_225 P_270) (connected UP P_270 P_315)
    (connected DOWN P_45 P_0) (connected DOWN P_90 P_45) (connected DOWN P_135 P_90) (connected DOWN P_180 P_135) (connected DOWN P_225 P_180) (connected DOWN P_270 P_225) (connected DOWN P_315 P_270)
    (connected SAME P_0 P_0) (connected SAME P_45 P_45) (connected SAME P_90 P_90) (connected SAME P_135 P_135) (connected SAME P_180 P_180) (connected SAME P_225 P_225) (connected SAME P_270 P_270) (connected SAME P_315 P_315)
    
    (connected RIGHT  T_270 T_315) (connected RIGHT T_315 T_0) (connected RIGHT T_0 T_45)
    (connected LEFT  T_315 T_270) (connected LEFT T_0 T_315) (connected LEFT T_45 T_0)
    (connected SAME T_0 T_0) (connected SAME T_45 T_45) (connected SAME T_90 T_90) (connected SAME T_270 T_270) (connected SAME T_315 T_315)
    
    (connected RIGHT X5 X6) (connected RIGHT X6 X7) (connected RIGHT X7 X8) (connected RIGHT X8 X9) (connected RIGHT X9 X10) (connected RIGHT X10 X11) (connected RIGHT X11 X12) (connected RIGHT X12 X13) (connected RIGHT X13 X14) (connected RIGHT X14 X15) (connected RIGHT X15 X16)
    (connected LEFT X6 X5) (connected LEFT X7 X6) (connected LEFT X8 X7) (connected LEFT X9 X8) (connected LEFT X10 X9) (connected LEFT X11 X10) (connected LEFT X12 X11) (connected LEFT X13 X12) (connected LEFT X14 X13) (connected LEFT X15 X14) (connected LEFT X16 X15)
    (connected SAME X5 X5) (connected SAME X6 X6) (connected SAME X7 X7) (connected SAME X8 X8) (connected SAME X9 X9) (connected SAME X10 X10) (connected SAME X11 X11) (connected SAME X12 X12) (connected SAME X13 X13) (connected SAME X14 X14) (connected SAME X15 X15) (connected SAME X16 X16)
    
    (connected DOWN Y2 Y3) (connected DOWN Y3 Y4) (connected DOWN Y4 Y5) (connected DOWN Y5 Y6) (connected DOWN Y6 Y7) (connected DOWN Y7 Y8) (connected DOWN Y8 Y9) (connected RIGHT Y9 Y10) (connected RIGHT Y10 Y11) (connected RIGHT Y11 Y12) (connected RIGHT Y12 Y13)
    (connected UP Y3 Y2) (connected UP Y4 Y3) (connected UP Y5 Y4) (connected UP Y6 Y5) (connected UP Y7 Y6) (connected UP Y8 Y7) (connected UP Y9 Y8) (connected LEFT Y10 Y9) (connected LEFT Y11 Y10) (connected LEFT Y12 Y11) (connected LEFT Y13 Y12)
    (connected SAME Y2 Y2) (connected SAME Y3 Y3) (connected SAME Y4 Y4) (connected SAME Y5 Y5) (connected SAME Y6 Y6) (connected SAME Y7 Y7) (connected SAME Y8 Y8) (connected SAME Y9 Y9) (connected SAME Y10 Y10) (connected SAME Y11 Y11) (connected SAME Y12 Y12) (connected SAME Y13 Y13)
    
    (= (distance X5 X6) 10) (= (distance X6 X7) 10) (= (distance X7 X8) 10) (= (distance X8 X9) 10) (= (distance X9 X10) 10) (= (distance X10 X11) 10) (= (distance X11 X12) 10) (= (distance X12 X13) 10) (= (distance X13 X14) 10) (= (distance X14 X15) 10) (= (distance X15 X16) 10)
    (= (distance X6 X5) 10) (= (distance X7 X6) 10) (= (distance X8 X7) 10) (= (distance X9 X8) 10) (= (distance X10 X9) 10) (= (distance X11 X10) 10) (= (distance X12 X11) 10) (= (distance X13 X12) 10) (= (distance X14 X13) 10) (= (distance X15 X14) 10) (= (distance X16 X15) 10)
    (= (distance X5 X5) 0) (= (distance X6 X6) 0) (= (distance X7 X7) 0) (= (distance X8 X8) 0) (= (distance X9 X9) 0) (= (distance X10 X10) 0) (= (distance X11 X11) 0) (= (distance X12 X12) 0) (= (distance X13 X13) 0) (= (distance X14 X14) 0) (= (distance X15 X15) 0) (= (distance X16 X16) 0)
    
    (= (distance Y2 Y3) 10) (= (distance Y3 Y4) 10) (= (distance Y4 Y5) 10) (= (distance Y5 Y6) 10) (= (distance Y6 Y7) 10) (= (distance Y7 Y8) 10) (= (distance Y8 Y9) 10) (= (distance Y9 Y10) 10) (= (distance Y10 Y11) 10) (= (distance Y11 Y12) 10) (= (distance Y12 Y13) 10)
    (= (distance Y3 Y2) 10) (= (distance Y4 Y3) 10) (= (distance Y5 Y4) 10) (= (distance Y6 Y5) 10) (= (distance Y7 Y6) 10) (= (distance Y8 Y7) 10) (= (distance Y9 Y8) 10) (= (distance Y10 Y9) 10) (= (distance Y11 Y10) 10) (= (distance Y12 Y11) 10) (= (distance Y13 Y12) 10)
    (= (distance Y2 Y2) 0) (= (distance Y3 Y3) 0) (= (distance Y4 Y4) 0) (= (distance Y5 Y5) 0) (= (distance Y6 Y6) 0) (= (distance Y7 Y7) 0) (= (distance Y8 Y8) 0) (= (distance Y9 Y9) 0) (= (distance Y10 Y10) 0) (= (distance Y11 Y11) 0) (= (distance Y12 Y12) 0) (= (distance Y13 Y13) 0)

    (at CHARGE_BASE_1 X10 Y2)
    (at CHARGE_BASE_2 X6 Y10)

    (at CAMERA_1 P_0 T_0)
    (at CAMERA_2 P_0 T_0)

    (at LEADER X10 Y2)
    (= (dischargeRate LEADER SLOW) 0.02) (= (dischargeRate LEADER FAST) 0.05) (= (chargeRate LEADER) 0.01) (= (maxCharge LEADER) 100) (= (currentCharge LEADER) 80)
    (chargeBaseState LEADER DOCK) (in SLOW LEADER) (has CAMERA_1 LEADER)
    (=(speed LEADER SLOW) 1) (=(speed LEADER FAST) 2.5)

    (at FOLLOWER X6 Y10)
    (= (dischargeRate FOLLOWER SLOW) 0.001) (= (dischargeRate FOLLOWER FAST) 0.03) (= (chargeRate FOLLOWER) 0.05) (= (maxCharge FOLLOWER) 200) (= (currentCharge FOLLOWER) 120)
    (chargeBaseState FOLLOWER DOCK) (in SLOW FOLLOWER) (has CAMERA_2 FOLLOWER)
    (=(speed FOLLOWER SLOW) 0.5) (=(speed FOLLOWER FAST) 0.8)
  )

  (:goal (and
    (picture X5 Y9 P_0 T_0 SENT)
    (picture X16 Y13 P_0 T_0 SENT)

    ;X0 X1 X2 X3 X4 X5 X6 X7 X8 X9 X10 X11 X12 X13 x14 X15 X16 X17 X18 X19 - X    
    ;Y0                                                                    - Y
    ;Y1                                                                    - Y
    ;Y2                             L                                      - Y
    ;Y3                                                                    - Y
    ;Y4                                                                    - Y
    ;Y5                                                                    - Y
    ;Y6                                                                    - Y
    ;Y7                                                                    - Y
    ;Y8                                                                    - Y
    ;Y9              P                                                     - Y
    ;Y10                F                                                  - Y
    ;Y11                                                                   - Y
    ;Y12                                                                   - Y
    ;Y13                                                    P              - Y
    ;Y14                                                                   - Y
    ;Y15                                                                   - Y
    ;Y16                                                                   - Y
    ;Y17                                                                   - Y
    ;Y18                                                                   - Y
    ;Y19                                                                   - Y
  ))

  (:constraints (and
    (preference UAV_OUT_BASE
      (forall (?UAV - UAV) (always (chargeBaseState ?UAV UNDOCK)))
    )
    (preference UGV_OUT_BASE
      (forall (?UGV - UGV) (sometime (chargeBaseState ?UGV UNDOCK)))
    )
  ))

  (:metric minimize (+
    (* 
      (+
        (*(totalTime) 0.7)
        (*(totalBattery) 0.3)
      ) 
    0.4)
    (*
      (+
        (*(is-violated UAV_OUT_BASE) 0.5)
        (*(is-violated UGV_OUT_BASE) 0.5)
      ) 
    0.6)
  ))
)