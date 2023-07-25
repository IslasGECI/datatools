#!/usr/bin/env bash

week=${1}
file_path=${2}
in2csv --sheet "Hoja${week}" "${file_path}" > tmp_csv
./src/get_weekly_summary_socorro.sh tmp_csv
cp weekly_summary_socorro_cleaned_format.csv "results/week_${week}.csv"
