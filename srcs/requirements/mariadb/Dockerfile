FROM debian:buster

ADD tools /tools

ADD conf /conf

RUN /bin/bash /tools/default_setup.sh

EXPOSE 3306

CMD ["/bin/bash", "tools/post_setup.sh"]