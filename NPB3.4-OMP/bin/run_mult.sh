#!/bin/bash

for i in `seq 1 10`; do
	for appA in *.x; do
	       	for appB in *.x; do
		       	if [ "$appA" == "$appB" ]; then
			       	sbatch run_mult.batch $appA $appB
			fi
		done
	done
done
