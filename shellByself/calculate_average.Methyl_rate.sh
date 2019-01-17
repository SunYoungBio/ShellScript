bedtools intersect -a $1 -b $2 -wa -wb | bedtools groupby -g 1,2,3,4 -c 9,10  > groupby1234.bed
awk '{print$0"\t"$(NF-1)/($(NF-1)+$NF)}' groupby1234.bed |sort -k4,4V | bedtools groupby  -g 4 -c 7  -o mean > result.txt
