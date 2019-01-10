for i in `ls *_somatic`
do
	awk 'NR==FNR{a[$1"\t"$2]=$3;next}; a[$1"\t"$2]<$7{print $0"\t"a[$1"\t"$2]}'\
	/datapool/Analysis/PipelineDev/29.MSI/RD03_Pan70/181230_TPNB500221AR_0093_AHGLWJBGX7/MSI_H_paired/adjust_para/test_299list_i0.045/299list_cutoff.txt\
	$i > ${i}_cutoff.txt
	MSnumber=`wc -l ${i}_cutoff.txt | cut -d ' ' -f 1`
	MStotal=`head -n2 ${i%_somatic} | tail -n1 | cut -f 1`
	perc=`awk 'BEGIN{print "'$MSnumber'"/"'$MStotal'"*100}'`
	echo -e "$MStotal\t$MSnumber\t$perc" >> ${i%_somatic}
done
