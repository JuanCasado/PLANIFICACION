(define (problem problemSpace2)
    (:domain space)
    (:objects 
        satellite1 - satellite
        instrument1 - instrument
        spectrograph2 - mode
        phenomenon3 - direction
        star0 - direction
    )
    (:init
        (has satellite1 instrument1)
        (looking SATELLITE1 star0)
        (supports instrument1 spectrograph2)
    )
    (:goal (and 
        (haveImage phenomenon3 spectrograph2)
    ))
)