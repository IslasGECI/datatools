#!/usr/bin/env bash

set -euo pipefail

tmp_socorro_data="tmp_socorro_data.csv"
tmp_socorro_dates_format="tmp_socorro_dates_format.csv"
socorro_cleaned_date_format="socorro_cleaned_format.csv"

raw_dates_format=${1}
csvcut -c 2-12 $raw_dates_format > $tmp_socorro_raw_dates_format
./src/fix_dates_socorro.sh $tmp_socorro_raw_dates_format > $socorro_cleaned_date_format
./src/get_weekly_summary.sh $socorro_cleaned_date_format
