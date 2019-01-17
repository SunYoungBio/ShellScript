bedtools merge -i $1 -d 1000 > merged1000.bed
bedtools flank -i merged1000.bed -l 1000 -g ~/rice_genome/nip/makewindows/Tigr7_chromosomes_length.txt -r 0 | awk '{print$0"\tA"}' > up1k.bed
bedtools flank -i merged1000.bed -l 0 -g ~/rice_genome/nip/makewindows/Tigr7_chromosomes_length.txt -r 1000 | awk '{print$0"\tC"}' > down1k.bed
awk '{print$0"\tB"}' merged1000.bed > DHS.bed
cat up1k.bed DHS.bed down1k.bed | sort -k1,1V -k2,2n > upDHSdown1k.bed
bedtools makewindows -b upDHSdown1k.bed -n 10 -i srcwinnum > upDHSdown1k_w10.bed

