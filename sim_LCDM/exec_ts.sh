#!/bin/bash
echo 'start script'
echo 'compile main programmes for LCDM test'
mpif90 ts_program_parallel_1.f90 -o test_l1.out
mpif90 ts_program_parallel_2.f90 -o test_l2.out
mpif90 ts_program_parallel_3.f90 -o test_l3.out
mpif90 ts_program_parallel_4.f90 -o test_l4.out
mpif90 ts_program_parallel_5.f90 -o test_l5.out
mpif90 ts_program_parallel_6.f90 -o test_l6.out
mpif90 ts_program_parallel_7.f90 -o test_l7.out
mpif90 ts_program_parallel_8.f90 -o test_l8.out
sleep 5
echo 'run main programme for LCDM test - 1'
mpirun -n 8 ./test_l1.out
sleep 5
echo 'run main programme for LCDM test - 2'
mpirun -n 8 ./test_l2.out
sleep 5
echo 'run main programme for LCDM test - 3'
mpirun -n 8 ./test_l3.out
sleep 5
echo 'run main programme for LCDM test - 4'
mpirun -n 8 ./test_l4.out
sleep 5
echo 'run main programme for LCDM test - 5'
mpirun -n 8 ./test_l5.out
sleep 5
echo 'run main programme for LCDM test - 6'
mpirun -n 8 ./test_l6.out
sleep 5
echo 'run main programme for LCDM test - 7'
mpirun -n 8 ./test_l7.out
sleep 5
echo 'run main programme for LCDM test - 8'
mpirun -n 8 ./test_l8.out
sleep 5
echo 'everything done - script terminated'
