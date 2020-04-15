cd ./TaAs

# 1. Get tight binding model
tar xzvf wannier90_hr.dat.tar.gz
mv wannier90_hr.dat Wannier90_hr.dat


# 2. calculate band structure
cp wt.in-bands wt.in
mpirun -np 2 ../../src/wt.x

# 3. Find all Weyl points
cp wt.in-findnodes wt.in
mpirun -np 2 ../../src/wt.x
