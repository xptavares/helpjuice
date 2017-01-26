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

#### Obs
If you downloaded the older versions before, you need to run this script to create slugs.
```ruby
Article.all.each { |a| a.touch }
```

# Running Project

```bash
bin/rails s
```

# How to

after run seed, you can enter on http://localhost:3000/how-do-i-cancel-my-subscription
if you enter with a slug not found they should redirect to search.

# Tes Project

```bash
bin/rspec
```
