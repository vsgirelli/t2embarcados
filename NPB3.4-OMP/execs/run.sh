#!/bin/bash

cd slurm
rm -f *
cd ../

for rep in {1..30}; do
  for class in A B C; do
    sbatch --error="slurm/%j_is.$class.err" --output="slurm/%j_is.$class.out" -J "emb.is.$class" run.slurm is $class
  done
done
