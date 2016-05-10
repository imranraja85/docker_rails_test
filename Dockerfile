FROM ruby:2.2.2-wheezy
MAINTAINER Imran Raja
RUN apt-get update && apt-get install -qq -y build-essential git-core --fix-missing --no-install-recommends
WORKDIR /tmp
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
ADD Gemfile /tmp/Gemfile
ADD Gemfile.lock /tmp/Gemfile.lock
RUN bundle install --system --jobs 10 --retry 5
WORKDIR /home/app
RUN pwd
ADD . /home/app
EXPOSE 3000
CMD ["rake", "assets:precompile"]
CMD ["rails", "server"]
