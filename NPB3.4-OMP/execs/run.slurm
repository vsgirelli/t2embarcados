#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --partition=draco
#SBATCH --exclude=draco5

printf "\t Running on $SLURM_JOB_NODELIST \n\n"
date

app=$1
class=$2

date=`date +"%m-%d-%y.%H:%M:%S"`

# necessário arrumar o meu working dir no SCRATCH
rm -rf $SCRATCH/NPB3.4-OMP/
cp -r ~/emb/t2/NPB3.4-OMP/ $SCRATCH
cd $SCRATCH/NPB3.4-OMP/execs/results/
#rm -r *

outdir="$app.$class.$date"

mkdir -p $outdir
cd $outdir

appdir="$SCRATCH/NPB3.4-OMP/bin/"

for threads in 1 2 4 8 16 32; do
  export OMP_NUM_THREADS=$threads
  $appdir/$app.$class.x
done

`gfortran -v` > machine_info
hostnamectl >> machine_info

cd ..

cp -r $outdir $HOME/emb/t2/NPB3.4-OMP/execs/results/$outdir
date
