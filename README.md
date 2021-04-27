# `boop_docker`

A `docker-compose` capable installation of [Boop](https://github.com/microlith57/boop).

## Dependencies

- Docker
- Docker Compose (version 3 or later)
- Git

## Installation

1.  Download this repository, making sure to initialise the `boop` submodule (`git clone https://github.com/microlith57/boop_docker --depth 1 --recursive`)
2.  Build the Compose stack (`docker-compose build`)
3.  Obtain the credential files:
    - If you already have `credentials.yml.enc` and `master.key`, copy them into this directory
    - Otherwise, run `docker-compose run web bash -c "EDITOR=cat rails credentials:edit"`
4.  Set up the database:
    - If you have a `db` directory, copy it into this directory
    - Otherwise, run `docker-compose run web rails db:setup`
5.  Run the server with `docker-compose up`
