FROM ubuntu:14.04

RUN ( \ 
        apt-get update && \
        ln -sf /bin/bash /bin/sh \
    )

RUN ( \
        apt-get update && \
        apt-get --yes --assume-yes install -y python-software-properties software-properties-common wget \
    )

RUN ( \
        add-apt-repository ppa:saltstack/salt && \
        apt-get update \
    )

RUN ( \
        wget --quiet http://cor-net.org/wp-content/uploads/2015/02/calamari-server_1.3-rc-16-g321cd58_amd64.deb && \
        ( dpkg -i calamari-server_1.3-rc-16-g321cd58_amd64.deb || true ) && \
        apt-get --yes --assume-yes install -f && \
        rm calamari-server_1.3-rc-16-g321cd58_amd64.deb \
    ) 

RUN ( \
        cp $(which python2.7) /opt/calamari/venv/local/bin/python && \
        locale-gen en_US.UTF-8 \
    )

