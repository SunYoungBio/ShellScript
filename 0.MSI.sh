fatherpath='/datapool/Analysis/ResDev/RD03_Pan70/190107_TPNB500221AR_0096_AHGKFVBGX7'
mydirs=`ls -l $fatherpath | cut -d ' ' -f 10 | awk '/RD03.*CF/'`			#get bamFile dir
myMSIlist='/datapool/Analysis/PipelineDev/29.MSI/RD03_Pan70/181230_TPNB500221AR_0093_AHGLWJBGX7/MSI_H_paired/adjust_para/test_299list_i0.045/PanCancer_70_RD03_msi_299.list'
#echo $mydirs
for i in $mydirs
	do
	#echo $i
	bamFile=${fatherpath}/${i}/04.DEDUP/${i}.dedup.bam		#get bamFile
	#echo $bamFile
	msisensor msi -d ${myMSIlist}\
		-t ${bamFile} \
		-e /datapool/Analysis/ResDev/Bed/Sim_V7_3_primary_targets_expand20.bed \
		-o ${i} -p 5 -s 3 -c 200 -i 0.0000001 &
	done
