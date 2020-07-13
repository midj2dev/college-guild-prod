FROM ruby:2.4.1 AS build

COPY ./ /app

RUN cd /app && bundle install --without development test

WORKDIR /app


