FROM stevenk11/ibus

RUN apt-get update && apt-get install -y --no-install-recommends \
	wget \
	ca-certificates \
        libatkmm-1.6-1v5 \
        libcairomm-1.0-1v5 \
        libglibmm-2.4-1v5 \
        libgtkmm-3.0-1v5 \
        libnotify4 \
        libpango1.0-0 \
        libpangomm-1.4-1v5 \
        libsecret-1-0 \
        libsigc++-2.0-0v5 \
        libxss1 \
        libzip4 \
	apulse \
	&& rm -rf /var/lib/apt/lists/*

RUN cd /tmp \
	&& wget https://www.trillian.im/get/linux/6.3/trillian_6.3.0.1_amd64.deb \
	&& dpkg -i trillian_6.3.0.1_amd64.deb \
	&& apt-get purge -y --autoremove wget

COPY entrypoint.sh /usr/bin/starttrillian

ENTRYPOINT /usr/bin/starttrillian
