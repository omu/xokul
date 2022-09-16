FROM ondokuz/ruby:buster-22.1

ENV PATH=/app/bin:$PATH

ARG RAILS_ENV=development
ENV RAILS_ENV=$RAILS_ENV

ARG RAILS_MASTER_KEY
ENV RAILS_MASTER_KEY=$RAILS_MASTER_KEY

ENV RAILS_SERVE_STATIC_FILES=enabled
ENV RAILS_LOG_TO_STDOUT=enabled

ENV NODE_ENV=production
ENV NODE_ENV=$NODE_ENV

WORKDIR /app

RUN bundle config --global silence_root_warning true

COPY . ./

EXPOSE 3000

CMD bundle exec puma -C config/puma.rb

