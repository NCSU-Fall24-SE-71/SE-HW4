 grep -l "sample" dataset1/file_* 
 | xargs grep -o "CSC510" 
 | cut -d: -f1 
 | sort 
 | uniq -c 
 | grep -E '^[[:space:]]*[3-9][0-9]* ' 
 | gawk '{ cmd = "stat -c%s " $2; cmd | getline size; close(cmd); print $1, $2, size }' 
 | sort -k1,1nr -k3,3nr 
 | grep -oE '(file_[1-9][0-9]*)' 
 | sed 's/file_/filtered_/'