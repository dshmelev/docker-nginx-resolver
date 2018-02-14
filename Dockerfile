FROM nginx:stable

MAINTAINER Dmitry Shmelev, dmitry.shmelev@jetbrains.com

ENV RESOLVER_PARAMS="valid=10s"

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
