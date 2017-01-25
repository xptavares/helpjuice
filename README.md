# README

# Setup Enviroment

#### Install Postgres

Install postgresql and put Trust like this [link](http://stackoverflow.com/questions/12387866/postgres-9-2-database-asks-for-password-despite-open-trust-settings)

#### Install Elasticsearch

```bash
brew install elasticsearch
```

#### Install Project

```bash
git@github.com:xptavares/helpjuice.git
cd helpjuice
bundle install
bin/rails db:drop db:create db:migrate db:seed
```

# Running Project

```bash
bin/rails s
```

# Tes Project

```bash
bin/rspec
```
