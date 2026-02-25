set -e

c++ -fomit-frame-pointer -fverbose-asm -S main.cpp -o ./main.S
code ./main.S
