
combine () {
  local path=../Daten/$1

  # Combines all monthly datasets into a single, temporary file
  awk '(NR == 1) || (FNR > 1)' $path/Monatlich/*_$1.csv > $path/tmp.csv

  # Removes any empty lines
  sed '/^$/d' $path/tmp.csv > $path/Komplett_$1.csv
  
  # Removes the sed backup file
  rm $path/tmp.csv
}

combine 2020
combine 2021