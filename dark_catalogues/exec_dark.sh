#!/bin/bash
echo 'start script'
echo 'compile main programm'
mpif90 fim_program_parallel.f90 -o dark.out
sleep 5
echo 'run main programme'
mpirun -n 8 ./dark.out
sleep 5
echo 'everything done - script terminated'