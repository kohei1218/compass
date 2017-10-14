FROM ruby:2.4.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs git npm
RUN npm install -g npm && npm install -g bower
RUN ln -s /usr/bin/nodejs /usr/bin/node

ENV APP_ROOT /app
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

ADD . $APP_ROOT

RUN bundle install --path /app/vendor/bundle
