#!/bin/bash
echo 'start script'
echo 'compile main programmes for ts test'
mpif90 ts_program_parallel_4.f90 -o test_l4.out
mpif90 ts_program_parallel_5.f90 -o test_l5.out
mpif90 ts_program_parallel_6.f90 -o test_l6.out
mpif90 ts_program_parallel_7.f90 -o test_l7.out
mpif90 ts_program_parallel_8.f90 -o test_l8.out
sleep 5
echo 'run main programme for ts test - 4'
mpirun -n 8 ./test_l4.out
sleep 5
echo 'run main programme for ts test - 5'
mpirun -n 8 ./test_l5.out
sleep 5
echo 'run main programme for ts test - 6'
mpirun -n 8 ./test_l6.out
sleep 5
echo 'run main programme for ts test - 7'
mpirun -n 8 ./test_l7.out
sleep 5
echo 'run main programme for ts test - 8'
mpirun -n 8 ./test_l8.out
sleep 5
echo 'everything done - script terminated'
