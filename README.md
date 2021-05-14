# `boop_docker`

A docker container for [Boop](https://github.com/microlith57/boop).

## Requirements

- Docker and `docker-compose`

## Installation

1.  Download the `docker-compose.yml` file from [here](./docker-compose.yml)
2.  (Optional): Generate a master key with `docker-compose run web rails secret` and keep it in a safe place
3.  Obtain an encrypted credential file:
    - If you already have `credentials.yml.enc`, copy it into the same directory as the docker-compose file
    - Otherwise, create a blank file in its place, and run `RAILS_MASTER_KEY=key docker-compose run web bash -c "EDITOR=cat rails credentials:edit"` (replacing `key` with your master key)
4.  Set up the database with `POSTGRES_USERNAME=postgres POSTGRES_PASSWORD=postgres RAILS_MASTER_KEY=key docker-compose run web rails db:setup` (replacing environment variable values appropriately)
5.  Run the server with `POSTGRES_USERNAME=postgres POSTGRES_PASSWORD=postgres RAILS_MASTER_KEY=key docker-compose up` (replacing environment variable values appropriately)
