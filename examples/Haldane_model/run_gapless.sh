# !/bin/bash
python haldane_hr_gen-gapless.py
cp wt.in-gapless wt.in
mpirun -np 2 wt.x

gnuplot bulkek.gnu
gnuplot bulkek_plane.gnu
gnuplot slabek.gnu



# 3. Gapless semimetal phase

# 1). Run WannierTools 
#     $ python haldane_hr_gen-gapless.py
#     $ cp wt.in-gapless wt.in
#     $ mpirun -np 2 wt.x &

# 2). Plot band structure
#     $ gnuplot bulkek.gnu
#     $ gnuplot bulkek_plane.gnu
#     $ evince bulkek.pdf
#     $ eog bulkek_plane.png

# 3). Plot band structure of slab system
#     $ gnuplot slabek.gnu
#     $ eog slabek.png