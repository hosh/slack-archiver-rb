FROM phusion/passenger-ruby21

RUN gem install -n /usr/bin bundler
RUN gem install -n /usr/bin rake

ENV INSTALL_DIR /opt/slack-archiver
ADD . $INSTALL_DIR/

WORKDIR $INSTALL_DIR
RUN /usr/bin/bundle install

VOLUME ["/data"]

CMD /usr/bin/bundle exec $INSTALL_DIR/bin/archive list
