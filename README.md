# Hix One Fourteen Zero Pg

Ruby on Rails application initialized with [Hix on Rails][hixonrails].

## System dependencies

- Ruby version: 2.7.1
- Rails version: 6.0.3.3
- Database: PostgreSQL
- Redis installed

## Configuration

Copy an existing sample environment file. Run:
```bash
$ cp .env.sample .env
```

and edit newly created `.env` file. The minimum you are going to need are
credentials to your local PostgreSQL database.

Then, install all the necessary gems:
```bash
bundle install
```

## Database creation

In order to create the database with all the necessary seed data, run:
```bash
$ rails db:create db:structure:load:with_data db:seed
```

## How to start the app

The simplest way to start the app is using `foreman` gem.
```bash
gem install foreman
foreman start -f Procfile.dev
```
It is not included in the _Gemfile_, [as advised in its documentation][foreman].

If you prefer running all of the processes separately, read on.

Start the Ruby on Rails server with:
```bash
rails server
```
To run Sidekiq, launch another process with:
```bash
bundle exec sidekiq
```
In order to intercept emails sent with ActionMailer in development
install the `mailcatcher` gem locally:
```bash
gem install mailcatcher
```
and visit your mailbox [http://127.0.0.1:1080/](http://127.0.0.1:1080/).

All emails send with your app will appear here.

## How to run the test suite

In order to run the whole test suite, run:

```bash
$ bundle exec rspec
```

## Code quality checks

The application provides the following code quality analysis tools:

- [Brakeman][brakeman]
- [Fasterer][fasterer]
- [RuboCop][rubocop] with [RuboCop RSpec][rubocop-rspec], [RuboCop Performance][rubocop-performance] and [RuboCop Rails][rubocop-rails]
- [Rails Best Practices][rails-best-practices]
- [Bundler Audit][bundler-audit]

To run them locally:

```bash
$ bundle exec brakeman
$ bundle exec fasterer
$ bundle exec rubocop
$ bundle exec rails_best_practices
$ bundle audit
```

[hixonrails]: https://hixonrails.com
[brakeman]: https://github.com/presidentbeef/brakeman
[rubocop]: https://github.com/rubocop-hq/rubocop
[rubocop-performance]: https://github.com/rubocop-hq/rubocop-performance
[rubocop-rspec]: https://github.com/rubocop-hq/rubocop-rspec
[rubocop-rails]: https://github.com/rubocop-hq/rubocop-rails
[fasterer]: https://github.com/DamirSvrtan/fasterer
[foreman]: https://github.com/ddollar/foreman#installation
[rails-best-practices]: https://github.com/flyerhzm/rails_best_practices
[bundler-audit]: https://github.com/rubysec/bundler-audit
