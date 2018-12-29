FROM ruby:2.5.1
LABEL maintainer="Marcos Soares"

RUN apt-get update -qq && apt-get install -y build-essential

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for capybara-webkit
RUN apt-get install -y libqtwebkit4 libqt4-dev xvfb

# for a JS runtime
RUN apt-get install -y nodejs

ENV APP_HOME /microblog
RUN mkdir $APP_HOME
COPY . $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN echo "gem: --no-ri --no-rdoc" >> ~/.gemrc
RUN bundle install
ADD . $APP_HOME