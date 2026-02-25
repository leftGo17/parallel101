set -e

c++ -O3 -fomit-frame-pointer -fverbose-asm -S main1.cpp -o ./main1.S
code ./main1.S
