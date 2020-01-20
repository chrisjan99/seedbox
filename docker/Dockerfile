FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -qq update && \
    apt-get -qq upgrade && \
    apt-get install -qqy --no-install-recommends \
        build-essential \
        locales \
        cmake \
        software-properties-common \
        python3 \
        python3-pip \
        wget \
        htop \
        nload \
        git \
        vim \
        ctags \
        curl \
        automake \
        libcppunit-dev \
        libtool \
        zlib1g-dev \
        gawk \
        libsigc++-2.0-dev \
        libssl-dev \
        libncurses5-dev \
        libncursesw5-dev \
        libcurl4-openssl-dev \
        libxmlrpc-c++8-dev \
        fuse \
        zip \
        unzip \
        rar \
        unrar \
        nginx-full \
        php \
        php-fpm \
        apache2-utils \
        php-cgi \
        php-cli \
        php-geoip
RUN add-apt-repository -y ppa:deluge-team/ppa && \
    add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable && \
    apt-get -qq update && \
    apt-get -qqy install deluged deluge-web deluge-console qbittorrent-nox
WORKDIR /tmp
RUN wget -q -O /tmp/libtorrent-0.13.8.tar.gz http://rtorrent.net/downloads/libtorrent-0.13.8.tar.gz
RUN wget -q -O /tmp/rtorrent-0.9.8.tar.gz http://rtorrent.net/downloads/rtorrent-0.9.8.tar.gz
RUN tar xfz libtorrent-0.13.8.tar.gz && \
    tar xfz rtorrent-0.9.8.tar.gz && \
    cd /tmp/libtorrent-0.13.8 && \
    ./autogen.sh && ./configure --disable-debug && make -j && make install && ldconfig && \
    cd /tmp/rtorrent-0.9.8 && \
    ./autogen.sh && ./configure --with-xmlrpc-c --with-ncurses --enable-ipv6 --disable-debug && make -j && make install && cd .. && \
    rm -rf /tmp/* && mkdir /run/php
WORKDIR /
RUN sed -i 's/\/run\/php\/php7\.2-fpm\.sock/127\.0\.0\.1:9000/g' /etc/php/7.2/fpm/pool.d/www.conf
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade setuptools
RUN pip3 install flexget
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
COPY start.sh /start.sh
COPY update-tracker.py /usr/lib/python2.7/dist-packages/deluge/ui/console/commands/update-tracker.py
RUN sed '888 aextension=geoip.so' -i /etc/php/7.2/fpm/php.ini
RUN sed -i 's/upload_max_filesize\ =\ 2M/upload_max_filesize\ =\ 128M/g' /etc/php/7.2/fpm/php.ini
RUN sed -i 's/max_file_uploads\ =\ 20/max_file_uploads\ =\ 2000/g' /etc/php/7.2/fpm/php.ini
RUN sed -i 's/post_max_size\ =\ 8M/post_max_size\ =\ 128M/g' /etc/php/7.2/fpm/php.ini
EXPOSE 18000-18300
STOPSIGNAL SIGTERM
ENTRYPOINT ["/start.sh"]
