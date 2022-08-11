#!/usr/bin/env bash

week=${1}
in2csv --sheet "Hoja${week}" datos/junio.xlsx > tmp_csv
./src/get_weekly_summary_socorro.sh tmp_csv
mv weekly_summary_socorro_cleaned_format.csv week_${week}.csv
