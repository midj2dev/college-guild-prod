FROM ruby:2.4.1 AS build
#Install git
RUN bundle install --without development test

WORKDIR /app

#Copy the build's output binary from the previous build container
COPY --from=build ./ /app
ENTRYPOINT ["rails server -e production -p 80"]
