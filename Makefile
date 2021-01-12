tests: install
	bats tests/bats_test/test_weekly_resume.sh
	R -e "testthat::test_dir('tests/testthat/', report = 'summary', stop_on_failure = TRUE)"
	pytest --verbose tests/bashtest/

# Enlista phonies
.PHONY: clean install format tests

format:
	black --check --line-length 100 tests && \
	R -e "library(styler)" \
	  -e "style_dir('src')" \
	  -e "style_dir('tests/testthat')"

# Instala estas herramientas miscelaneas
install:
	# Copia ejecutables
	mkdir --parents /usr/local/bin
	cp ./src/* /usr/local/bin
	chmod +x /usr/local/bin/*
	export PATH="$${PATH}:/usr/local/bin"

clean:
	rm --force *.tmp
	rm --force *.csv
	rm --recursive --force tests/**/__pycache__
	rm --force tests/data_tests/weekly_summary_IG_POSICION_TRAMPAS_30AGO2020_sin_capturas.csv