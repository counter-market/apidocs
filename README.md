### Up and running

bundle install
bundle exec middleman server

### Build static

bundle exec middleman build --clean

docker-compose run app bundle exec middleman build --clean