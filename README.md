1. First create header files of both input files (data/q3_first.tsv and data/q3_second.tsv) with the command; 
   sed '1s/^/FirstColumnName,OtherColumn1,OtherColumn2,...\n/' your_data.tsv > your_data_with_header.tsv

2. The final command is Rscript join_list_of_files.R list_q3.tsv > join_output.tsv. 
