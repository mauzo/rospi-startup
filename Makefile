include config.mk

systemd_units=rospi-roscore.service

all:
	true

install:
	for u in ${systemd_units}; do \
	    install -o root -g root -m 644 "$$u" "${SYSTEMD_DIR}"; \
	done

clean:
	true

distclean:
	rm config.mk
