PREFIX?=/usr/local
INSTALLDIR?=$(DESTDIR)$(PREFIX)

all: install

install:
	install -Dm644 license.mkd "$(INSTALLDIR)/share/licenses/dmenu-tools/dmenu-tools.txt"

	install -d "$(INSTALLDIR)/bin"
	install -Dm755 src/* "$(INSTALLDIR)/bin"

	install -d "$(INSTALLDIR)/share/doc/dmenu-tools"
	install -Dm644 doc/* "$(INSTALLDIR)/share/doc/dmenu-tools"

uninstall:
	rm $(INSTALLDIR)/bin/dmenu_{edit,menu,mpc,netctl,run_recent,raise,raise_or_run}
	rm -rf "$(INSTALLDIR)/share/doc/dmenu-tools"
	rm -rf "$(INSTALLDIR)/share/licenses/dmenu-tools"

.PHONY: all install uninstall
