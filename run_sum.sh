#!/bin/bash
#SBATCH --job-name=sum
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --gres=gpu:1
# SBATCH --ntasks-per-node=4
#SBATCH --dependency=afterok:425620
# SBATCH --partition=standard
# SBATCH --partition=_workgroup_
# SBATCH --partition=devel
#SBATCH --time=0-6:00:00
# SBATCH --mail-user=zhaochengz02@gmail.com
# SBATCH --mail-type=END,FAIL
# SBATCH --cpus-per-task=1
# SBATCH --mem=8G
# SBATCH --mem-per-cpu=1024M
# SBATCH --tmp=1T
#SBATCH --output=check.out
# SBATCH --error=%x-%j.out

a=(na 0 1)
current=$(pwd)

cp sum_ref/*.py data
cd data

python sum.py
