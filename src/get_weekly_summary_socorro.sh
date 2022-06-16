#!/usr/bin/env bash

set -euo pipefail

socorro_cleaned_date_format="socorro_cleaned_format.csv"
tmp_socorro_selected_columns="tmp_socorro_selected_columns.csv"

raw_dates_format=${1}
csvcut -c 2-12 "$raw_dates_format" > $tmp_socorro_selected_columns
./src/fix_dates_socorro.sh "$tmp_socorro_selected_columns" > $socorro_cleaned_date_format
./src/get_weekly_summary.sh $socorro_cleaned_date_format
