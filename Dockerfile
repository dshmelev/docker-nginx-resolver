FROM nginx:stable

MAINTAINER Dmitry Shmelev, dmitry.shmelev@jetbrains.com

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
