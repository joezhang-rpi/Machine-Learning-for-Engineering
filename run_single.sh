
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
			sed -i "s/sxbbb/${a[$ii]}/g" control.txt
			sed -i "s/sybbb/${a[$jj]}/g" control.txt
			sed -i "s/szbbb/${a[$kk]}/g" control.txt
			./gccm_single
			cd $current
		  fi
		done
	done
done
