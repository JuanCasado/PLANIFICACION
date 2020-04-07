
# Inter Jungle

[League of Legends](https://euw.leagueoflegends.com/es-es/) is a challenging multiplayer online battle arena (MOBA).
Lots of players try to arrive with the best strategies in order to get advantage over the enemy team as fast as possible.

One way to do so is to gain gold and xp faster than the other team.
XP and gold can be earned by killing jungle camps which are spread along the map.

## What is been modeled

* **The map**: The game has a static symmetric map that defines the path that players can take to go from one point to another.
  * The map has been translated to a set of nodes. There is a node at each intersection of the map.
  * The distance between nodes has been carefully measured in the real map.
  * At some nodes of the camps the lanes and the camps have been places according to the real map.
* **Jungle Camps** (8): Each camp give a different amount of gold and xp.
* **Lanes** (3): The player can also go to a lane and help (gank) a partner.

![LOL Map](./LoL.png)

## Modeling decisions

Other previos problems have been modeled using durative actions or none durative actions.
Int this one we have mixed both since the gank action does not have time.

### Actions

* **move**: Change the player location from one place (node) in the map to another.
* **gank**: Help a lane when we are there.
* **doCamp**: Kill the monster jungle when we are there and earn the gold and xp.

## How to configure your plan

There are several ways the planner can be configured according on your play style.

### Gank a certain lane

A possible goal to use can be to gank a certain lane.
The planner will maximize the metric mut will at least do this action.

``` lisp
(:goal (and
  (gankedlane TOP)
  (gankedlane BOT)
))
```

### Gank at least a lane (the best one to maximice the goal)

The goal can also be set to at least gank without saying what to gank.
The planner will choose that for us.

``` lisp
(:goal (and
  (gank TOP)
))
```

### Make a certain amount of camps before gank

Ganking immediately may not be the best idea.
Doing some camps before ganking could be better.
**This need to be said on the problem init, not in the goal**

``` lisp
(= (campsToDoBeforeGank) 0)
```

### Make a fixed amount of camps

Other possible goal could be to fixed the camps that need to be done.

``` lisp
(:goal (and
  (= (campsDone) 4)
))
```

### Earn more than a certain amount of gold or XP

Other option could be to desire a path that gets us with a certain amount of gold for example enough to buy something.

``` lisp
(:goal (and
  (>= (playerGold) 100)
  (>= (playerGold) 100)
))
```

### Maximize gold or xp or both

Both, one, or the other can be maximize while time is being minimize.

``` lisp
(:metric maximize (+
  (* (playerGold) 0.5)
  (* (playerXP) 0.5)
))
(:metric minimize total-time)
```

*Problem solved by:*

*Juan Casado Ballesteros*

*Juan José Córdoba Zamora*

*Gabriel López Cuenca*

*Miguel Ángle Losada Fernández*

*Sara Martínez Martínez*

*Sergio Sanz Sacristán*

*Álvaro Zamorano Ortega*
