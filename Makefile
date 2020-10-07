tests: install
	pytest --verbose tests/bashtest/
	bats tests/bats_test/test_weekly_resume.sh

# Enlista phonies
.PHONY: clean install format tests

format:
	black --check --line-length 100 tests

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