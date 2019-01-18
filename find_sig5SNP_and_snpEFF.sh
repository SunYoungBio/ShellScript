for i in `ls *.qqman`
do
cat $i | awk '$4<=1e-5{print"Chr"$2"\t"$3"\t"$3"\t"$4}' | sed '1iChr\tfrom\tto\tP' > ${i%.qqman}_sig.e-5_SNP.bed
vcftools --vcf /gss1/home/xjdang/GATK_calling_SNP/remove_wildRice/remove_wildRice_GATK_snps_miss0.75Maf0.05.recode.vcf --bed ${i%.qqman}_sig.e-5_SNP.bed --recode --out ${i%.qqman}_sig.e-5_SNP	
java -Xmx40g -jar ~/software/snpEff/snpEff.jar irgsp1.1 ${i%.qqman}_sig.e-5_SNP.recode.vcf -s ${i%.qqman}_sig.e-5_SNP.summary.html > ${i%.qqman}_sig.e-5_SNP.irgsp1.1.ann.vcf
done
