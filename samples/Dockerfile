FROM debian:buster

RUN apt-get update

RUN apt-get -y install nginx

EXPOSE 443

ADD tools /

ADD conf /

CMD ["/bin/bash", "tools/post_setup.sh"]
