# !/bin/bash
# Generate tight-binding model and input file for WannierTools
python haldane_hr_gen-chern-insulator.py
cp wt.in-chern-insulator wt.in
# Run WannierTools
mpirun -np 2 ../../src/wt.x
# Plot band structure
gnuplot bulkek.gnu
gnuplot bulkek_plane.gnu
# Plot Berry curvature
gnuplot Berrycurvature.gnu
# Plot Wannier charge center
gnuplot wcc.gnu
# Plot band structure of slab system
gnuplot slabek.gnu

# 2. Chern insulator phase

# Do the same step as Trivial insulator phase but with haldane_hr_gen-chern-insulator.py
# and wt.in-chern-insulator