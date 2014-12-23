FROM phusion/passenger-ruby21

RUN gem install -n /usr/bin bundler
RUN gem install -n /usr/bin rake
