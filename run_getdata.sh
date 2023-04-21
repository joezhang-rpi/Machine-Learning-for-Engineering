#!/bin/bash
#SBATCH --job-name=getdata
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --gres=gpu:1
# SBATCH --ntasks-per-node=4
#SBATCH --dependency=afterok:425619
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
mkdir ndata

sp=0
for ii in {1..2..1}
do
	for jj in {1..2..1}
	do
		for kk in {1..2..1}
		do
		    if !(((ii==1))&&((jj==1))&&((kk==1)));then
			((sp=sp+1))
			cd ${a[$ii]}${a[$jj]}${a[$kk]}
			for ll in {1..12..1}
			do
				cd p$ll
				b=0
				for mm in {1..20..1}
				do
					for nn in {1..20..1}
					do
						((b=b+1))
						cd x$mm-y$nn
						cp com_data.txt $current/ndata/$sp$ll$b.txt
						#echo $sp$ll$b
						cd ../
					done
				done
				cd ../
			done
			cd $current
		    fi
		done
	done
done
