FROM jekyll/builder:latest

WORKDIR /app

RUN gem install jekyll bundler

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 4000
CMD ["bundle", "exec", "jekyll", "serve", "--host=0.0.0.0", "--baseurl=/dev-env"]