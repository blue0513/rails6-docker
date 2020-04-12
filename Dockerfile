FROM ruby:2.7

WORKDIR /app

# bundle install
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

# yarn install
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
        && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn
COPY yarn.lock /app/yarn.lock
RUN yarn install

COPY . /app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
# https://dev.to/andrewmcodes/hiding-ruby-2-7-deprecation-warnings-in-rails-6-2mil
ENV RUBYOPT '-W:no-deprecated -W:no-experimental'
CMD ["rails", "server", "-b", "0.0.0.0"]
