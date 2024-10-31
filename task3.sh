gawk -F',' '$3 == 2 && $NF ~ /S/ {print}' titanic.csv | sed 's/male/M/; s/female/F/' | gawk -F',' '{print; if ($7 != "") {ageSum += $7; ageCount++}} END {print "\nAverage age:", ageSum / ageCount}'
