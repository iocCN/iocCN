FROM debian:10.3-slim

ENV IOC_RELEASE DIONS-SIRIUS-v5.0.0.0-g5729cf1
ENV DEBIAN_SH dions-aurora-deb.sh

WORKDIR /ioc
RUN apt update && apt install -y wget unzip
RUN wget -O ioc.sh "https://github.com/IOCoin/DIONS/releases/download/$IOC_RELEASE/$DEBIAN_SH" \
&& chmod +x ./ioc.sh \
&& ./ioc.sh --noexec --target /tmp \
&& mv /tmp/demon/iocoind . \
&& rm -rf /tmp/* \
&& rm -f ./ioc.sh

RUN mkdir datadir conf

EXPOSE 33765

COPY docker-entrypoint.sh .
RUN chmod +x docker-entrypoint.sh

ENTRYPOINT ["/ioc/docker-entrypoint.sh"]
