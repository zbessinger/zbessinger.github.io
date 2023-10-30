FROM ruby:alpine3.18

ARG JEKYLL_VERSION=4.3.2

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV TZ=UTC
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US

# Packages needed to get needed gems built
RUN apk --no-cache add \
  build-base \
  libffi-dev \
  libxslt \
  libffi \
  tzdata \
  su-exec \
  libressl \
  shadow \
  protobuf

# Setup env
WORKDIR /srv/jekyll
COPY Gemfile .
COPY Gemfile.lock .

RUN gem install bundler:2.1.4 jekyll:$JEKYLL_VERSION
RUN bundle install
RUN gem uninstall google-protobuf nokogiri -aIx
RUN gem install --platform ruby google-protobuf nokogiri


EXPOSE 4000

CMD [ "/usr/local/bundle/bin/bundle", "exec", "jekyll", "serve", "--port", "4000", "--host", "0.0.0.0" ]

STOPSIGNAL 2