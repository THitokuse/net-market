FROM ruby:2.5.1
ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apt-get install -y mecab libmecab-dev mecab-ipadic mecab-ipadic-utf8

# Install node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install nodejs

# Install yarn
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "vim"]


RUN gem install bundler -v 2.0.1

RUN mkdir /mercari
WORKDIR /mercari
ADD Gemfile /mercari/Gemfile
ADD Gemfile.lock /mercari/Gemfile.lock
RUN bundle install

ADD . /mercari
