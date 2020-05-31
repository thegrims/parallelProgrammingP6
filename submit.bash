#!/bin/bash
#SBATCH -J first
#SBATCH -A cs475-575
#SBATCH -p class
#SBATCH --gres=gpu:1
#SBATCH -o first.out
#SBATCH -e first.err
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=grimshaa@oregonstate.edu
for LOCAL_SIZE in 64
do
    g++ -D LOCAL_SIZE=$LOCAL_SIZE -o first first.cpp /usr/local/apps/cuda/cuda-10.1/lib64/libOpenCL.so.1.1 -lm -fopenmp
    ./first
done