FROM ruby:3.1.1

WORKDIR /app
COPY Gemfile* .
RUN bundle install
COPY . .
RUN rm -rf frontend
EXPOSE 3000

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

CMD ["entrypoint.sh"]
