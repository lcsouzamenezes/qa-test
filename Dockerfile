FROM ruby:2.6

RUN apt-get update && \
    apt-get install -y net-tools

# Install gems
ENV APP_HOME /qa-test
ENV HOME /root
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile* $APP_HOME/
RUN bundle install

# Upload source
COPY . $APP_HOME

# Start server
ENV PORT 4567
EXPOSE 4567
CMD ["ruby", "app.rb"]