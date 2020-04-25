

### Heuristics

The heuristic implementation has been taken from [Stanford.edu](http://theory.stanford.edu/~amitp/GameProgramming/Heuristics.html).

* Manhattan: great for maps that allow 4 movements at each grid point.
* Octile: great for maps that allow 8 movements at each grid point.
* Chebyshev: great for maps that allow 4 movements at each grid point.
* Euclidean: grat for maps that allow any movement at each grid point.

Every heuristic implemented can be configured with a scale factor.
This cale factor directly multiplies the value obtained from the heuristic.
If it is about the correct magnitude will reduce the amount of nodes that are expanded.

* A scale factor of 0 transforms A* in dijkstra algorithm.
* A scale factor of infinite transforms A* in a greedy algorithm that strictly follows the provided heuristic.
* The ideal scale factor is about: (minimum cost of taking one step)/(expected maximum path length)
