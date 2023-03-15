all: check coverage mutants

.PHONY: \
	all \
	check \
	clean \
	coverage \
	format \
	init \
	install \
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
	  -e "resumen <- rbind(resumen, style_dir('robinson_data'))" \
	  -e "resumen <- rbind(resumen, style_dir('validates_tdp'))"
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
	  -e "style_dir('robinson_data')" \
	  -e "style_dir('validates_tdp')"
	black --line-length 100 src
	black --line-length 100 tests

init: setup tests

install: install_robinson install_validate

install_robinson: 
	cd robinson_data && R -e "devtools::document()" && \
	R CMD build . && \
	R CMD check robinson.data_0.1.0.tar.gz && \
	R CMD INSTALL robinson.data_0.1.0.tar.gz

install_validate:
	cd validates_tdp && R -e "devtools::document()" && \
	R CMD build . && \
	R CMD check validates.tdp_0.1.0.tar.gz && \
	R CMD INSTALL validates.tdp_0.1.0.tar.gz

linter:
	sqlfluff lint src/*.sql

mutants:
	@echo "🏹😞 No mutation testing on Bash 👾🎉👾"

setup: install
	chmod +x ./src/*
	mkdir --parents /usr/local/bin
	cp ./src/* /usr/local/bin

tests: tests_bash tests_r

tests_bash:
	bats tests/bats_test/test_weekly_resume.sh

tests_r: tests_r_robinson_data tests_r_validate

tests_r_robinson_data:
	cd robinson_data && R -e "devtools::test()"

tests_r_validate:
	cd validates_tdp && R -e "devtools::test()"
