FROM ruby:3.0.1

WORKDIR /usr/src/app

RUN  apt-get update -qq \
  && apt-get install -y --no-install-recommends postgresql-client \
  && curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
  && apt-get install -y nodejs \
  && rm -rf /var/lib/apt/lists/*
RUN npm install --global yarn

COPY boop/Gemfile /usr/src/app/Gemfile
COPY boop/Gemfile.lock /usr/src/app/Gemfile.lock
RUN bundle install

COPY boop /usr/src/app
RUN rails assets:precompile

EXPOSE 3000
ENV RAILS_ENV production
ENV NODE_ENV production
ENV RAILS_SERVE_STATIC_FILES true
CMD [ "rails", "server", "-e", "production", "-p", "3000", "-b", "0.0.0.0", "--log-to-stdout" ]
