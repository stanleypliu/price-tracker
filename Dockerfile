FROM ruby:2.7.0
RUN apt-get update -qq && apt-get install -y postgresql-client software-properties-common npm
RUN npm install npm@latest -g && \
    npm install n -g && \
    n latest

WORKDIR /price-tracker
COPY Gemfile /price-tracker/Gemfile
COPY Gemfile.lock /price-tracker/Gemfile.lock
RUN gem install bundler -v 2.1.2
RUN bundle check || bundle install

COPY docker /price-tracker/docker

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y --no-install-recommends yarn

COPY package.json yarn.lock ./
RUN yarn install --check-files

COPY . ./

ENTRYPOINT ["./entrypoint.sh"]
