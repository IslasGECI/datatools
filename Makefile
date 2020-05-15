tests: install
	. ./tests/test_geci-install
	. ./tests/test_make-install
	cd tests && . ./test_geci-tdp2xls

# Enlista phonies
.PHONY: install tests

# Instala estas herramientas miscelaneas
install:
	# Copia ejecutables
	mkdir --parents /usr/local/bin
	cp ./src/* /usr/local/bin
	chmod +x /usr/local/bin/*
	export PATH="$${PATH}:/usr/local/bin"
