all: tests

.PHONY: \
	all \
	check \
	clean \
	coverage \
	format \
	install \
	mutants \
	tests

check:
	sqlfluff lint src/*.sql

clean:
	rm --force --recursive tests/**/__pycache__
	rm --force *.csv
	rm --force *.tmp
	rm --force tests/data_tests/weekly_summary_IG_POSICION_TRAMPAS_30AGO2020_sin_capturas.csv

coverage: install tests

format:
	R -e "library(styler)" \
	  -e "style_dir('src')" \
	  -e "style_dir('tests/testthat')"
	sqlfluff fix src/*.sql

install:
	chmod +x ./src/*
	mkdir --parents /usr/local/bin
	cp ./src/* /usr/local/bin

mutants:
	@echo "🏹😞 No mutation testing on Bash 👾🎉👾"

tests:
	bats tests/bats_test/test_weekly_resume.sh
	R -e "testthat::test_dir('tests/testthat/', report = 'summary', stop_on_failure = TRUE)"
