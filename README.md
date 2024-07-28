# README

## Prerequisites
- Ruby (v3.1.3)

## Setup
- Run `bundle install`
- Run `bundle exec rails db:create db:migrate db:test:prepare`
- Run `bundle exec rails db:seed`
- Install foreman by running `gem install foreman` (optional)

## Running the application
Start the app by running:

```
./bin/dev
```

## Running tests
Run the tests by running:

```
bundle exec rspec spec
```

## Assumptions
- Emission file structure is standard

## Improvements
- Authentication / Authorization
- Use a more suitable database like PostgreSQL
- Use background job apps (rabbitmq, sidekiq)
- Add kogging / monitoring
- Add processed status to `Emission` model
