# Fat Free CRM
# Container Rails + ffcrm
# container DB
# container nginX

# docker build -t peha/ffcrm:v1 .
# docker run --name db -e POSTGRES_PASSWORD=*** -d postgres
# docker run --name ffcrm --link db -e DB_PASS=*** -d peha/ffcrm:v1

FROM rails:latest

#FROM phusion/passenger-ruby21

RUN apt-get update && apt-get install -y \
    libmagick++-dev \
    libxml2 libxml2-dev \ 
    libxslt1.1 \
    libxslt1-dev \
    libyaml-dev \
    sudo \
    postgresql \
    postgresql-client \
    libpq-dev

# Create ffcrm user
RUN groupadd -r ffcrm && useradd -r -g ffcrm ffcrm

RUN sudo adduser ffcrm sudo

RUN mkdir /home/ffcrm/ && chown -R ffcrm:ffcrm /home/ffcrm/

RUN chown -R ffcrm:ffcrm /usr/local/bundle

COPY docker-entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

USER ffcrm

RUN git clone https://github.com/fatfreecrm/fat_free_crm /home/ffcrm

WORKDIR /home/ffcrm

# RUN cp config/database.postgres.docker.yml config/database.yml

RUN bundle install

EXPOSE 3000

ENTRYPOINT ["/entrypoint.sh"]

CMD ["rails","server"]