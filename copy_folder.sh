
a=(na 0 1)

for ii in {1..2..1}
do
	for jj in {1..2..1}
	do
		for kk in {1..2..1}
		do
			if !(((ii==1))&&((jj==1))&&((kk==1)));then
				#mkdir ${a[$ii]}${a[$jj]}${a[$kk]}
				cp -r unit_cell ${a[$ii]}${a[$jj]}${a[$kk]}
			fi
		done
	done
done
