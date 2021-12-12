FROM debian:buster

RUN apt-get update

RUN apt-get -y install g++

#RUN apt-get -y install nginx

#EXPOSE 443

COPY main.cpp /

RUN g++ -o test main.cpp

CMD ["/test"]
