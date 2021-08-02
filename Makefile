all: tests

.PHONY:
	all \
	clean \
	format \
	install \
	tests

clean:
	rm --force --recursive tests/**/__pycache__
	rm --force *.csv
	rm --force *.tmp
	rm --force tests/data_tests/weekly_summary_IG_POSICION_TRAMPAS_30AGO2020_sin_capturas.csv

format:
	R -e "library(styler)" \
	  -e "style_dir('src')" \
	  -e "style_dir('tests/testthat')"

install:
	chmod +x ./src/*
	mkdir --parents /usr/local/bin
	cp ./src/* /usr/local/bin

tests:
	bats tests/bats_test/test_weekly_resume.sh
	R -e "testthat::test_dir('tests/testthat/', report = 'summary', stop_on_failure = TRUE)"
