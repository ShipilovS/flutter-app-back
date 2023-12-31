FROM ruby:3.1.1-alpine
RUN apk add --update --no-cache \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      nano \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      openssl \
      libpq-dev \
      pkgconfig \
      tzdata

RUN gem install bundler -v 2.4.20
WORKDIR /app
COPY Gemfile Gemfile.lock ./
COPY . ./
RUN bundle install
RUN chmod +x /app/migration.sh
ENTRYPOINT ["/app/migration.sh"]
CMD ["rails", "s", "-b", "0.0.0.0"]
EXPOSE 3000
