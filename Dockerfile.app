FROM ruby:2.4.2

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs git
RUN npm install -g bower yarnpkg

ENV APP_ROOT /app
ENV BUNDLE_PATH /bundle
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN bundle install

ADD . $APP_ROOT
