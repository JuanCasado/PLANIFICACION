(define (problem problemSpace1)
    (:domain space)
    (:objects 
        SATELLITE1 - satellite
        SATELLITE2 - satellite
        INSTRUMENT1 - instrument
        INSTRUMENT2 - instrument
        INSTRUMENT3 - instrument
        Mode_thermograph0 - mode
        NONE - direction
        DirPhenomenon4 - direction
        DirStar5 - direction
        DirPhenomenon6 - direction
    )
    (:init
        (has SATELLITE1 INSTRUMENT1)
        (has SATELLITE2 INSTRUMENT2)
        (has SATELLITE2 INSTRUMENT3)
        (looking SATELLITE1 NONE)
        (looking SATELLITE2 NONE)
        (supports INSTRUMENT1 Mode_thermograph0)
        (supports INSTRUMENT2 Mode_thermograph0)
        (supports INSTRUMENT3 Mode_thermograph0)
    )
    (:goal (and 
        (haveImage DirPhenomenon4 Mode_thermograph0)
        (haveImage DirStar5 Mode_thermograph0)
        (haveImage DirPhenomenon6 Mode_thermograph0)
    ))
)