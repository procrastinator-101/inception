FROM debian:buster

ADD tools /tools

ADD conf /conf

ARG SERVED_PATH

ARG WORDPRESS_PACKAGE=wordpress-5.9.tar.gz

RUN /bin/bash /tools/default_setup.sh

EXPOSE 9000

CMD ["/bin/bash", "tools/post_setup.sh"]
