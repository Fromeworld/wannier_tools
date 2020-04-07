# !/bin/bash
# Generate tight-binding model and input file for WannierTools
python haldane_hr_gen-trivial-insulator.py
cp wt.in-trivial-insulator wt.in
# Run WannierTools
mpirun -np 2 wt.x
# Plot band structure
gnuplot bulkek.gnu
gnuplot bulkek_plane.gnu
# Plot Berry curvature
gnuplot Berrycurvature.gnu
# Plot Wannier charge center
gnuplot wcc.gnu
# Plot band structure of slab system
gnuplot slabek.gnu

