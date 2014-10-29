#!/bin/sh


# first, set up macqiime so we can run these commands in a subshell
source /macqiime/configs/bash_profile.txt
# source /home/appls/Qiime/1.8.0/activate.sh

#######################  
#  INSTRUCTIONS:
# 
# navigate Terminal to a directory containing these things: 
#  * seqs.fna = demultiplexed fasta file
#  * map.txt  = QIIME-format metadata for all samples
#  * pickTheseOTUs.sh = this script
#
# You should empty the directory of old attempts. 
#
# Then call up macqiime BEFORE executing the script
# macqiime
# 
# Then execute the script and hope it goes well:
# ./pickTheseOTUs.sh
#
# If the directory has some files that will be replaced, 
#   the script will ask you if that is ok. 
# Answer with 1 for yes or 2 for no. 
#
########################




########################
# Set some directory shortcuts
#   !! This will be different on every computer !! 
#   !! So check the location first              !!

# export QIIME_DIR=/home/appls/Qiime
# export reference_seqs=$QIIME_DIR/greengenes/rep_set/97_otus.fasta
# export reference_tax=$QIIME_DIR/greengenes/taxonomy/97_otu_taxonomy.txt

export QIIME_DIR=/macqiime
export reference_seqs=$QIIME_DIR/greengenes/gg_13_8_otus/rep_set/97_otus.fasta
export reference_tax=$QIIME_DIR/greengenes/gg_13_8_otus/taxonomy/97_otu_taxonomy.txt
# export reference_tree=$QIIME_DIR/greengenes/gg_13_8_otus/trees/97_otus.tree






#################
# The slow way
#   This results in a .biom file with taxonomy.
#

echo 'picking OTUs. This will take some time ...'

# Reverse compliment the sequence reads. 
# Only necessary if sequences are reverse reads. 
# If so, you will probably get an error that says that 
# the otu map is empty. 
adjust_seq_orientation.py -i seqs.fna -o seqsRC.fna -r


# This command does all of the processing. 
pick_closed_reference_otus.py -i seqsRC.fna -r $reference_seqs -o out -t $reference_tax -f 
# pick_open_reference_otus.py -i seqs.fna -r $reference_seqs -o out 

echo 'adding metadata ... '

biom add-metadata -i out/otu_table.biom -o otu_table_metadata.biom -m map.txt

# summarize the final otu table. 
biom summarize-table -i out/otu_table.biom -o otu_table_stats.txt

# Add total number of sequences to the bottom of this new file
echo '\n-----------------------------\n' >> otu_table_stats.txt
echo 'this many sequences were in the original "seq.fna" file:' >> otu_table_stats.txt
grep -c '>' seqs.fna >> otu_table_stats.txt

# Then spit out the whole file to assess how things went. 
echo '\nthese stats can be found in "otu_table_stats.txt":\n'
echo '-----------------------------\n'
head -n 1000 otu_table_stats.txt
echo '\n-----------------------------\n'

