set -e

c++ -ffast-math -O3 -fopenmp -fomit-frame-pointer -fverbose-asm -S main.cpp -o ./main.S
code ./main.S
