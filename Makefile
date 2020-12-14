sinclude config.mk

systemd_units=	rospi-roscore.service
cleanfiles=	${systemd_units}
distcleanfiles=	config.mk

INSTALL_FILE=	install -o root -g root -m 644
INSTALL_DIR=	install -o root -g root -m 755 -d

subst_args=	-e's!@ROS_DIR@!${ROS_DIR}!g'

%: %.in
	sed ${subst_args} <$< >$@

.PHONY: all install clean distclean

all: ${systemd_units}
	true	

install:
	${INSTALL_DIR} "${DESTDIR}${SYSTEMD_DIR}"
	for u in ${systemd_units}; do \
	    ${INSTALL_FILE} "$$u" "${DESTDIR}${SYSTEMD_DIR}"; \
	done

clean:
	rm -f ${cleanfiles}

distclean: clean
	rm -f ${distcleanfiles}
