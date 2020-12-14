sinclude config.mk

systemd_units=rospi-roscore.service

INSTALL_FILE=	install -o root -g root -m 644
INSTALL_DIR=	install -o root -g root -m 755 -d

all:
	true

install:
	${INSTALL_DIR} "${DESTDIR}${SYSTEMD_DIR}"
	for u in ${systemd_units}; do \
	    ${INSTALL_FILE} "$$u" "${DESTDIR}${SYSTEMD_DIR}"; \
	done

clean:
	true

distclean:
	rm -f config.mk
