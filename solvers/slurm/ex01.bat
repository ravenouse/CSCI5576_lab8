#!/bin/bash

# -
# |
# | This is a batch script for running a MPI parallel job on Summit
# |
# | (o) To submit this job, enter:  sbatch --export=CODE='/home/scru5660/HPSC/codes/fd_mpi/src' ex_01.bat 
# |
# | (o) To check the status of this job, enter: squeue -u <username>
# |
# -

# -
# |
# | Part 1: Directives
# |
# -

#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --time=00:01:00
#SBATCH --partition=shas-testing
#SBATCH --output=ex01-%j.out

# -
# |
# | Part 2: Loading software
# |
# -

source /projects/zhwa3087/CSCI5576/lab8/solvers/Modules_Summit

# -
# |
# | Part 3: User scripting
# |
# -

echo "=="
echo "||"
echo "|| Begin Execution of fd in slurm batch script."
echo "||"
echo "=="

echo "using $1"
mpirun -n 4 /projects/zhwa3087/CSCI5576/lab8/solvers/src/solvers -nPEx 2 -nPEy 2 -nCellx 100 -nCelly 100 -solver $1 > tty_$1.out
# mpirun -n 4 /projects/zhwa3087/CSCI5576/lab8/solvers/src/solvers -nPEx 2 -nPEy 2 -nCellx 5 -nCelly 5 -solver cg > tty_cg.out

echo "=="
echo "||"
echo "|| Execution of solver in slurm batch script complete."
echo "||"
echo "=="








