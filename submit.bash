#!/bin/bash
#SBATCH -J first
#SBATCH -A cs475-575
#SBATCH -p class
#SBATCH --gres=gpu:1
#SBATCH -o first.out
#SBATCH -e first.err
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=grimshaa@oregonstate.edu

for NUM_ELEMENTS in 1000 50000 250000 1000000 8000000
do
    for LOCAL_SIZE in 8 64 128 256 512
    do
        g++ -DLOCAL_SIZE=$LOCAL_SIZE -DNUM_ELEMENTS=$NUM_ELEMENTS -o first first.cpp /usr/local/apps/cuda/cuda-10.1/lib64/libOpenCL.so.1.1 -lm -fopenmp -w
        ./first
    done
done