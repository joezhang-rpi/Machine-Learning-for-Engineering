
a=(na 0 1)
current=$(pwd)

for ii in {1..2..1}
do
	for jj in {1..2..1}
	do
		for kk in {1..2..1}
		do
		    if !(((ii==1))&&((jj==1))&&((kk==1)));then
			cd ${a[$ii]}${a[$jj]}${a[$kk]}
			for ll in {1..12..1}
			do
				mkdir p$ll
				cp control.txt p$ll
				cp unitcell.xyz p$ll
				cp chosen.solution.txt p$ll
				cp select_pairs.txt p$ll
				cp gccm_generate p$ll
				cd p$ll

				((mm=1+(ll-1)*2))
				sed -n "$mm p" select_pairs.txt > dummy_pairs.txt
				lattice=$(awk '{ for(i=1;i<=NF;i++) {if(i>=1 && i<=9) printf "%s ", $i}; printf "\n"}' dummy_pairs.txt)
				sed -i "s/pairsbbb/$lattice/g" chosen.solution.txt
				./gccm_generate

				cd ../
			done
			cd $current
		    fi
		done
	done
done
