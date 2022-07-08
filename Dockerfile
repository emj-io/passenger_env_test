FROM phusion/passenger-ruby27

ARG TEST_VAR
ENV TEST_VAR=DIDTHISCHANGE

###
USER root

COPY sites-available/ /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/
RUN unlink /etc/nginx/sites-enabled/default
RUN rm /etc/service/nginx/down

###
USER app
WORKDIR /home/app

COPY config.ru config.ru

COPY Gemfile Gemfile
RUN bundle config --global jobs 8
RUN bundle install

COPY test_app.rb test_app.rb

###
USER root
EXPOSE 80
# CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0", "-p", "4567"]
