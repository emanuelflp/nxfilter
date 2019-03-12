FROM emanuelflp/zulu-jdk:8.0.202

MAINTAINER Emanuel Felipe <emanuelflp@gmail.com>
ARG NXFILTER_VERSION

# Download nxfilter
  RUN apk add --no-cache unzip curl && \
      curl -o /tmp/nxfilter-${NXFILTER_VERSION}.zip http://pub.nxfilter.org/nxfilter-${NXFILTER_VERSION}.zip && \
      mkdir /nxfilter && \
      unzip /tmp/nxfilter-${NXFILTER_VERSION}.zip -d /nxfilter && \
      rm -f /tmp/nxfilter-${NXFILTER_VERSION}.zip && \
      chmod +x /nxfilter/bin/startup.sh

CMD ["/nxfilter/bin/startup.sh"]
