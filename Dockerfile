FROM ruby:3.0.1

RUN apt-get update -qq \
&& apt-get install -y --no-install-recommends nodejs postgresql-client \
&& rm -rf /var/lib/apt/lists/*
WORKDIR /usr/src/app
COPY boop /usr/src/app
RUN bundle install

EXPOSE 3000
ENV RAILS_ENV production
CMD ["/usr/src/app/bin/bundle", "exec", "rails", "server", "-e", "production", "-p", "3000", "-b", "0.0.0.0"]
