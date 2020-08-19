FROM ubuntu:16.04

MAINTAINER Javier Peletier <jm@epiclabs.io>

ADD assets /assets
ADD /setup.sh /
ADD healthcheck.sh /
RUN /setup.sh
ADD /startup.sh /usr/sbin/startup.sh

SHELL ["/bin/bash", "-c"]

EXPOSE 1521
EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \ 
CMD [ "./healthcheck.sh" ]

ENTRYPOINT ["/usr/sbin/startup.sh"]
