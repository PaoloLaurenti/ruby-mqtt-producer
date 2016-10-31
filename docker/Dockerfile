FROM ruby:2.3
WORKDIR /app
COPY src/ .
RUN bundle install && chmod +x producer.rb
ENTRYPOINT ["./producer.rb", "produce"]
