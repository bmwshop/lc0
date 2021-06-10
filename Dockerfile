FROM vochicong/lc0-docker

RUN apt update
RUN apt install -y firefox libxcb-dri3-0 libnss3 libdrm2 libgbm-dev libxss1
RUN apt install -y wget unzip
RUN wget http://training.lczero.org/get_network?sha=f7f3f20e82b75a52889139362bb616149fa3981c9aa7094549190379473bad52 -O /weights.pt.gz
RUN gzip -d /weights.pt.gz
RUN wget https://github.com/rooklift/nibbler/releases/download/v2.1.6/nibbler-2.1.6-linux.zip 
RUN unzip nibbler-2.1.6-linux.zip
COPY lc0.config /lc0/bin
RUN chmod a+x /lcbot/nibbler-2.1.6-linux/nibbler
WORKDIR /lcbot/nibbler-2.1.6-linux
RUN mkdir -p /root/.config/Nibbler
COPY config.json /root/.config/Nibbler/
COPY engines.json /root/.config/Nibbler/
CMD /lcbot/nibbler-2.1.6-linux/nibbler --no-sandbox

