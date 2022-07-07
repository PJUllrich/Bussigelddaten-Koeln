
combine () {
  awk '(NR == 1) || (FNR > 1)' ../Daten/$1/*_$1.csv > ../Daten/$1/merged.csv
}

combine 2020
combine 2021