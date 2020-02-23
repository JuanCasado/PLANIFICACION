(define (domain robot)

    (:requirements
        :equality
        :negative-preconditions
        :typing
    )

    (:types
        location
        box
        robot
        switch
        door
    )

    (:predicates
        (at ?who - (either box robot switch) ?location - location)
        (on ?who - robot ?box - box)
        (isOn ?robot - robot)
        (powered ?switch - switch)
        (connected ?door - door ?firstLocation - location ?secondLocation - location)
        (isOpen ?door)
    )

    (:action go
        :parameters (
            ?robot - robot
            ?door - door
            ?currentLocation - location
            ?targetLocation - location
        )
        :precondition (and 
            (at ?robot ?currentLocation)
            (not (= ?currentLocation ?targetLocation))
            (connected ?door ?currentLocation ?targetLocation)
            (isOpen ?door)
            (not (isOn ?robot))
        )
        :effect (and
            (not (at ?robot ?currentLocation))
            (at ?robot ?targetLocation)
        )
    )
    
    (:action push
        :parameters (
            ?robot - robot
            ?box - box
            ?currentLocation - location
            ?targetLocation - location
            ?door - door
        )
        :precondition (and 
            (at ?box ?currentLocation)
            (at ?robot ?currentLocation)
            (not (= ?currentLocation ?targetLocation))
            (not (on ?robot ?box))
            (connected ?door ?currentLocation ?targetLocation)
            (isOpen ?door)
            (not (isOn ?robot))
        )
        :effect (and
            (at ?box ?targetLocation)
            (not (at ?box ?currentLocation))
        )
    )
    
    (:action climbUP
        :parameters (
            ?robot - robot
            ?box - box
            ?location - location
        )
        :precondition (and 
            (not (on ?robot ?box))
            (at ?robot ?location)
            (at ?box ?location)
            (not (isOn ?robot))
        )
        :effect (and
            (on ?robot ?box)
            (isOn ?robot)
        )
    )
    
    (:action climbDOWN
        :parameters (
            ?robot - robot
            ?box - box
            ?location - location
        )
        :precondition (and 
            (on ?robot ?box)
            (at ?robot ?location)
            (at ?box ?location)
            (isOn ?robot)
        )
        :effect (and
            (not (on ?robot ?box))
            (not (isOn ?robot))
        )
    )
    
    (:action switchON
        :parameters (
            ?robot - robot
            ?switch - switch
            ?box - box
            ?location - location
        )
        :precondition (and 
            (at ?box ?location)
            (at ?robot ?location)
            (at ?switch ?location)
            (not (powered ?switch))
            (on ?robot ?box)
        )
        :effect (and
            (powered ?switch)
        )
    )
    
    (:action switchOFF
        :parameters (
            ?robot - robot
            ?switch - switch
            ?box - box
            ?location - location
        )
        :precondition (and 
            (at ?box ?location)
            (at ?robot ?location)
            (at ?switch ?location)
            (not (powered ?switch))
            (on ?robot ?box)
        )
        :effect (and
            (not (powered ?switch))
        )
    )
    
    (:action open
        :parameters (
            ?robot - robot
            ?door - door
            ?location1 - location
            ?location2 - location
        )
        :precondition (and 
            (at ?robot ?location1)
            (connected ?door ?location1 ?location2)
            (not (isOpen ?door))
            (not (isOn ?robot))
        )
        :effect (and
            (isOpen ?door)
        )
    )
    
    (:action close
        :parameters (
            ?robot - robot
            ?door - door
            ?location1 - location
            ?location2 - location
        )
        :precondition (and 
            (at ?robot ?location1)
            (connected ?door ?location1 ?location2)
            (isOpen ?door)
            (not (isOn ?robot))
        )
        :effect (and
            (not (isOpen ?door))
        )
    )
    
)