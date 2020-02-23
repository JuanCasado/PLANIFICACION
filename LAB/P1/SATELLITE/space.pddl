(define (domain space)
    (:requirements
        :equality
        :negative-preconditions
        :typing
    )

    (:types
        satellite
        instrument
        direction
        mode
    )
    
    (:predicates
        (looking ?satellite - satellite ?direction - direction)
        (has ?satellite - satellite ?instrument - instrument)
        (powered ?instrument - instrument)
        (calibrated ?instrument - instrument)
        (onMaintenance ?satellite)
        (supports ?instrument - instrument ?mode - mode)
        (haveImage ?direction - direction ?mode - mode)
    )

    (:action turn
        :parameters (
            ?satellite - satellite 
            ?currentDirection - direction 
            ?targetDirection - direction 
        )
        :precondition (and 
            (looking ?satellite ?currentDirection)
            (not (= ?currentDirection ?targetDirection))
        )
        :effect (and 
            (looking ?satellite ?targetDirection)
            (not (looking ?satellite ?currentDirection))
        )
    )
    
    (:action switchOn
        :parameters (
            ?satellite - satellite
            ?instrument - instrument
        )
        :precondition (and
            (has ?satellite ?instrument)
            (not (powered ?instrument))
        )
        :effect (and
            (powered ?instrument)
        )
    )
    
    (:action switchOff
        :parameters (
            ?satellite - satellite
            ?instrument - instrument
        )
        :precondition (and
            (has ?satellite ?instrument)
            (powered ?instrument)
        )
        :effect (and
            (not (powered ?instrument))
        )
    )
    
    (:action calibrate
        :parameters (
            ?satellite - satellite
            ?direction - direction
            ?instrument - instrument
        )
        :precondition (and
            (has ?satellite ?instrument)
            (looking ?satellite ?direction)
            (powered ?instrument)
        )
        :effect (and
            (calibrated ?instrument)
        )
    )
    
    (:action maintenance
        :parameters (
            ?satellite - satellite
        )
        :precondition (and
            (not (onMaintenance ?satellite))
        )
        :effect (and
            (onMaintenance ?satellite)
        )
    )
    
    (:action takeImage
        :parameters (
            ?satellite - satellite
            ?direction - direction
            ?instrument - instrument
            ?mode - mode
        )
        :precondition (and
            (has ?satellite ?instrument)
            (calibrated ?instrument)
            (supports ?instrument ?mode)
            (powered ?instrument)
            (looking ?satellite ?direction)
            (onMaintenance ?satellite)
        )
        :effect (and
            (haveImage ?direction ?mode)
            (not (onMaintenance ?satellite))
        )
    )
    
)