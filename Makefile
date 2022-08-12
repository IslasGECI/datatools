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
	tests \
	tests_bash \
	tests_r

check:
	shellcheck --shell=bash src/*.sh
	R -e "library(styler)" \
	  -e "resumen <- style_dir('src')" \
	  -e "resumen <- rbind(resumen, style_dir('tests/testthat'))" \
	  -e "any(resumen[[2]])" \
	  | grep FALSE
	black --check --line-length 100 src
	black --check --line-length 100 tests
	flake8 --max-line-length 100 src
	flake8 --max-line-length 100 tests

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
	black --line-length 100 src
	black --line-length 100 tests

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
