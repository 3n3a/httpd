FROM ubuntu:focal

ENV TZ UTC

RUN set -eux; \
# installation
	apt-get update; \
	DEBIAN_FRONTEND=noninteractive apt-get full-upgrade -y; \
	DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
		apache2 \
		tzdata \
		pandoc \
		; \
	DEBIAN_FRONTEND=noninteractive apt-get remove --purge --auto-remove -y; \
	rm -rf /var/lib/apt/lists/*; \
# smoke test
	apache2 -v; \
	pandoc -v; \
# create manifest
	mkdir -p /usr/share/rocks; \
	(echo "# os-release" && cat /etc/os-release && echo "# dpkg-query" && dpkg-query -f '${db:Status-Abbrev},${binary:Package},${Version},${source:Package},${Source:Version}\n' -W) > /usr/share/rocks/dpkg.query

# https://httpd.apache.org/docs/2.4/stopping.html#gracefulstop
STOPSIGNAL SIGWINCH

COPY apache2-foreground /usr/bin/

RUN set -eux; \
# make apache2-frontend executable
    chmod +x /usr/bin/apache2-foreground; \
# apache modules
	a2enmod ext_filter; \
	a2enmod cache; \
	a2enmod cache_socache; \
	a2enmod socache_shmcb

EXPOSE 80
CMD ["/usr/bin/apache2-foreground"]
