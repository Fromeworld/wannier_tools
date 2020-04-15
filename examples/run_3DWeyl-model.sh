cd ./3DWeyl-model

# Here we start to study a toy model of Weyl semimetal
# You can use writeHmnR.f90 to generate tight binding Hamiltonian file Weyl3D_hr.dat. 
gfortran writeHmnR.f90 -o writehmnr
./writehmnr

# 1. Calculate band structure 
cp wt.in-bands wt.in
../../src/wt.x
gnuplot bulkek.gnu
# evince bulkek.pdf

# 2. Find all the Weyl points
cp wt.in-findnodes wt.in
../../src/wt.x
gnuplot Nodes.gnu
# eog Nodes.png

# 3. Calculate chirality of Weyl points
cp wt.in-chirality wt.in
../../src/wt.x
gnuplot wanniercenter3D_Weyl_1.gnu
gnuplot wanniercenter3D_Weyl_2.gnu
# evince wanniercenter3D_Weyl_1.eps
# evince wanniercenter3D_Weyl_2.eps
sed -n '/Chiralities/,/Time/p' WT.out

# 4. Calculate Berry curvature
cp wt.in-Berry-curvature wt.in
../../src/wt.x
gnuplot Berrycurvature-normalized.gnu-tutorial
# eog Berrycurvature-normalized.png

# 5. Calculate  surface  state  spectrum
cp wt.in-surfacestates wt.in
../../src/wt.x
gnuplot surfdos_l.gnu
gnuplot arc_l.gnu
# eog surfdos_l.png
# eog arc_l.png

# 6. Use WCCs to understand Fermi arc
cp wt.in-wcc-kz0 wt.in
../../src/wt.x
gnuplot wcc.gnu
cp wcc.eps wcc-kz0.eps
cp wt.in-wcc-kz0.5 wt.in
../../src/wt.x
gnuplot wcc.gnu
cp wcc.eps wcc-kz0.5.eps
# evince wcc-kz0.eps
# evince wcc-kz0.5.eps

# 7. Calculate anomalous hall conductivity
cp wt.in-AHC wt.in
mpiexec -np 4 ../../src/wt.x
gnuplot sigma_ahc.gnu
# evince sigma_ahc.pdf
