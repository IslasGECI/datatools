all: check coverage mutants

.PHONY: \
	all \
	check \
	clean \
	coverage \
	format \
	linter \
	mutants \
	setup \
	tests

check:
	shellcheck --shell=bash src/*.sh

clean:
	rm --force --recursive tests/**/__pycache__
	rm --force *.csv
	rm --force *.tmp
	rm --force tests/data_tests/weekly_summary_IG_POSICION_TRAMPAS_30AGO2020_sin_capturas.csv

coverage: setup tests

format:
	R -e "library(styler)" \
	  -e "style_dir('src')" \
	  -e "style_dir('tests/testthat')"
	sqlfluff fix src/*.sql

linter:
	sqlfluff lint src/*.sql

mutants:
	@echo "🏹😞 No mutation testing on Bash 👾🎉👾"

setup:
	chmod +x ./src/*
	mkdir --parents /usr/local/bin
	cp ./src/* /usr/local/bin

tests: tests_bash tests_r

tests_bash:
	bats tests/bats_test/test_weekly_resume.sh

tests_r:
	R -e "testthat::test_dir('tests/testthat/', report = 'summary', stop_on_failure = TRUE)"
