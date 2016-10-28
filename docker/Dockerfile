FROM ruby:2.3
COPY src/ /app
RUN cd /app && bundle install && chmod +x producer.rb
ENTRYPOINT ["/app/producer.rb"]
WORKDIR /app
