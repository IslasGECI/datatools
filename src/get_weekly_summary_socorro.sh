#!/usr/bin/env bash

set -euo pipefail

raw_dates_format=${1}
csvcut -c 2-12 $raw_dates_format