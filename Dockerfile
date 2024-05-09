# Ruby resmi imajını kullan
FROM jekyll/builder:latest

# Çalışma dizini oluştur
WORKDIR /app

# Jekyll ve bundler'ı yükle
RUN gem install jekyll bundler

# Gereken bağımlılıkları yükle
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Bütün dosyaları çalışma dizinine kopyala
COPY . .

# Konteyner başladığında Jekyll server'ını çalıştır
EXPOSE 4000
CMD ["bundle", "exec", "jekyll", "serve", "--host=0.0.0.0"]