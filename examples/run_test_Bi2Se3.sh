cd ./Bi2Se3/
cp ./.wt.in.travis wt.in
tar xzvf Bi2Se3_hr.tar.gz
../../src/wt.x

# plot
for f in *.gnu; do 
    gnuplot "$f"
done