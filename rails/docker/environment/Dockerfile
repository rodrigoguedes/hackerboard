FROM ubuntu:18.04

# Set ENV variables
ENV APP_DIRECTORY=/app

# Install NodeJS
RUN set -x && \
  apt-get update && \
  apt-get install -y curl && \
  curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh &&\
  bash nodesource_setup.sh && \
  apt-get install -y nodejs && \
  rm -rf /var/lib/apt/lists/*

# Install Ruby
RUN set -x && \
  apt-get update && \
  apt-get install -y vim && \
  apt-get install -y git-core && \
  apt-get install -y autoconf && \
  apt-get install -y bison && \
  apt-get install -y build-essential && \
  apt-get install -y libssl-dev && \
  apt-get install -y libyaml-dev && \
  apt-get install -y libreadline6-dev && \
  apt-get install -y zlib1g-dev && \
  apt-get install -y libncurses5-dev && \
  apt-get install -y libffi-dev && \
  apt-get install -y libgdbm5 && \
  apt-get install -y libgdbm-dev && \
  rm -rf /var/lib/apt/lists/*

# Install rbenv
RUN git clone https://github.com/rbenv/rbenv.git /usr/local/rbenv
RUN echo '# rbenv setup' > /etc/profile.d/rbenv.sh
RUN echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh
RUN echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
RUN chmod +x /etc/profile.d/rbenv.sh
# install ruby-build
RUN mkdir /usr/local/rbenv/plugins
RUN git clone https://github.com/rbenv/ruby-build.git /usr/local/rbenv/plugins/ruby-build
ENV RBENV_ROOT /usr/local/rbenv
ENV PATH "$RBENV_ROOT/bin:$RBENV_ROOT/shims:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# install ruby
ARG VERSION_RUBY
RUN rbenv install $VERSION_RUBY
RUN rbenv global $VERSION_RUBY
RUN gem install bundler

# Install Rails
ARG VERSION_RAILS
RUN gem install rails -v $VERSION_RAILS
RUN rbenv rehash

# Install app
WORKDIR $APP_DIRECTORY