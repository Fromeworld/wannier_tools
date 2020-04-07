cd ./IrF4/
tar xzvf IrF4_hr.tar.gz
mpirun -np 4 ../../src/wt.x

# plot
for f in *.gnu; do 
    gnuplot "$f"
done