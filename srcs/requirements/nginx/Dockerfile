FROM debian:buster

ADD tools /tools

ADD conf /conf

RUN /bin/bash /tools/default_setup.sh

EXPOSE 443
EXPOSE 80

CMD ["/bin/bash", "tools/post_setup.sh"]

