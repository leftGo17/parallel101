set -e

c++ -O3 -fomit-frame-pointer -fverbose-asm -S main.cpp -o ./main.S
code ./main.S
