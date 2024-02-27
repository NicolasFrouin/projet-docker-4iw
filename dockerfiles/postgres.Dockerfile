FROM alpine:latest

RUN apk update && apk upgrade

# Install postgresql
RUN apk add --no-cache postgresql

# Create a directory for the postgresql socket
RUN mkdir -p /run/postgresql

# Create a directory for postgresql
RUN mkdir -p /var/lib/postgresql

# Change the owner of the postgresql directories
RUN chown -R postgres:postgres /run/postgresql
RUN chown -R postgres:postgres /var/lib/postgresql

# Change to the postgres user
USER postgres

# Create a directory for postgresql data
RUN mkdir -p /var/lib/postgresql/data

# Change the permissions of the data directory so that only the owner can access it
RUN chmod 0700 /var/lib/postgresql/data

# Initialize the database
RUN initdb -D /var/lib/postgresql/data

VOLUME /var/lib/postgresql/data

ENV PGDATA=/var/lib/postgresql/data

EXPOSE 5432

CMD ["postgres"]