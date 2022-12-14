FROM ruby:3.1.2

RUN mkdir /app

WORKDIR /app 

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN bundle install

EXPOSE 3000
