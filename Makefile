tests: install
	pytest --verbose tests/bashtest/
	R -e "testthat::test_dir('tests/testthat/', report = 'summary', stop_on_failure = TRUE)"

# Enlista phonies
.PHONY: clean install tests

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