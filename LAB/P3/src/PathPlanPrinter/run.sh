
source ./env/bin/activate
python ./src/run_path_planning.py \
  --scenario ./res/test_2.png \
  --start "(27,19)" \
  --finish "(8,20)" \
  --grid_size 40 \
  --algorithm A*      `# Dijkstra  || A*`\
  --heuristic chebyshev   `# manhattan || naive || euclidean || octile || dijkstra || chebyshev`\
  --scale 1.001 \
  --out ./out/path.png
deactivate