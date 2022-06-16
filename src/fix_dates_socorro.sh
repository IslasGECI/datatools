#!/usr/bin/env bash

set -euo pipefail

Rscript src/fix_dates_socorro.R --data=${1}
