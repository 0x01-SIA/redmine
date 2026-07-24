FROM ruby:3.3.8-bookworm

ENV APP_HOME=/app \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    default-libmysqlclient-dev \
    mariadb-client \
    libyaml-dev \
    libxml2-dev \
    libxslt1-dev \
    libicu-dev \
    imagemagick \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR ${APP_HOME}

RUN gem install bundler -v 2.7.2

COPY Gemfile Gemfile.lock ./
COPY config/database.yml config/database.yml
COPY plugins/redmine_dashboard/Gemfile plugins/redmine_dashboard/Gemfile

RUN bundle install

COPY . .

RUN chmod +x docker/entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["docker/entrypoint.sh"]

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
