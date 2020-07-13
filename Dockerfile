FROM ruby:2.4.1 AS build

COPY ./ /app

RUN cd /app && bundle install --without development test
RUN cd /app && export S3_ACCESS_KEY=test && export S3_SECRET_KEY=test && rake assets:precompile RAILS_ENV=production


WORKDIR /app


