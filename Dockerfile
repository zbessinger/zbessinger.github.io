# FROM jekyll/jekyll:3.8.5
FROM jekyll/jekyll:pages

WORKDIR /srv/jekyll
COPY Gemfile .
COPY Gemfile.lock .

RUN gem install bundler:2.1.4	
RUN bundle install

EXPOSE 4000

CMD [ "/usr/gem/bin/bundle", "exec", "/usr/local/bundle/bin/jekyll", "serve", "--port", "4000", "--host", "0.0.0.0" ]

STOPSIGNAL 2