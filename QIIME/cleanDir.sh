#!/bin/sh

if [ -a otu_table.biom ];
then
echo "Do you want to remove the OTU-table-related files and folders? If yes, enter '1'."
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
 		  	rm -r -f otu_table_metadata
			rm -r -f otus
			rm -r -f prefix_picked_otus
			rm -r -f uclust_assigned_taxonomy
			rm -f otu_table_stats.txt
			rm -f otu_table.biom
    		break;;
        No ) echo 'Try deleting everything except: seqs.fna, map.txt, and this script.\n'; 
			exit;;
    esac
done
fi
