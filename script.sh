#!/bin/bash

input="/path/to/directory/asn_list.txt"
#this asn_list.txt is a list of the as-numbers you are going to query on.

while IFS= read -r line
do
  whois "$line"  >> /path/to/directory/sorting-out.txt
#this line does a whois query by line from asn_list, and put results in sorting-out.txt.
  
  grep -E '^(phone|e-mail|aut-num|as-name)' /path/to/directory/sorting-out.txt >> /path/to/directory/list_final.txt
#this line filters the line you need by keywords; phone|e-mail|aut-num|as-name; change these as you see fit.
  
  echo '**********************************************************************' >> /path/to/directory/list_final.txt
#makes it easy to read for multiple query.  
  
  rm /path/to/directory/sorting-out.txt
#deletes sorting-out file, it is not necessary anymore.  
  
  echo "$line"
#prints the line which it just worked on so its easier to see progress on terminal.  
  
done < "$input"
#repeats for next line.
