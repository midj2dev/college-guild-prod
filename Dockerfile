FROM ruby:2.4.1 AS build

COPY ./ /app

RUN bundle install --without development test

WORKDIR /app

ENTRYPOINT ["rails server -e production -p 80"]
