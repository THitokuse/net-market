FROM ruby:2.3.1
ENV LANG C.UTF-8

RUN echo "deb http://deb.debian.org/debian jessie main" > /etc/apt/sources.list &&\
    apt-get update -qq &&\
    apt-get install -y build-essential libpq-dev nodejs graphviz
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "vim"]


RUN gem install bundler -v 1.17.1

RUN mkdir /mercari
WORKDIR /mercari
ADD Gemfile /mercari/Gemfile
ADD Gemfile.lock /mercari/Gemfile.lock
RUN bundle install

ADD . /mercari
