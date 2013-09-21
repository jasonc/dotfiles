.PHONY: install
install: 
	@for SOURCE_DOTFILE in `ls | egrep -v "install.sh|Makefile|README.md"` ; \
	do \
		echo "Installing $${SOURCE_DOTFILE}." ; \
		DEST_DOTFILE=~/.$${SOURCE_DOTFILE} ; \
		install -v --backup=numbered -C -m 644 $$SOURCE_DOTFILE $$DEST_DOTFILE ; \
	done
