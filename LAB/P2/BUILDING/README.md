
# BUILDING

The problem has bee solved three times, once with numbers as real number, other time with some objects as numbers and another time with all numbers being objects.

## Numbers as numbers

For this part the recommendations to solve the problem have not been followed.
The lifts cannot move from any to any floor but from their current floor to the adjacent floors the lift type (fast or slow) can fo to.

By using number for the capacity as well as to define the floor at which persons and lifts are domain and problem definition gets simplified.
Nevertheless the planner became much more slower.
The main problem of using numbers to define floors is that the current floor at which the lifts are is not shown on the plan output so it need to be tracked down from the movements that the lift performs.

## Some numbers as objects

For this part the recommendations to solve the problem have been followed more than with the other.
Instead of defining four action to move the lifts (UP_FAST, DOWN_FAST, UP_SLOW, DOWN_SLOW) juts one has been used.
For the Board/Leaf actions the capacity of the lift is not show on the problem solution output.

On the solution with numbers as object the domain and plan definition gets harder.
Numbers instead of objects have been used to model the lift capacity.
Also maximum and minimum capacities for each lift are used.

## All numbers as objects

This part is in between of the other two in terms of speed.
Also is the less interesting option from the other two since quite a few operations are needed to be defined around the objects/number to properly work.

Nevertheless is the one better for debugging and understanding since the capacities as well as the floors are outputted on the problem solution.
