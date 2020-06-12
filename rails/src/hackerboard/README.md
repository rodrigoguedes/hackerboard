# README

### For Developer  
`bundle install`
`rails s -b 0.0.0.0`
`rake spec`

#### Setup database
`rake db:drop db:create db:schema:load db:seed` or `rake db:drop db:setup --trace`

#### Run automatically integration tests
bundle exec guard -p

#### Setup SMTP server for development environment
`gem install mailcatcher`

`mailcatcher --foreground --ip 0.0.0.0`

#### Rake command for importal all models to elastichsearch
`rake environment elasticsearch:import:all FORCE=y`

#### Start Elasticsearch
`sudo systemctl enable elasticsearch`
`sudo systemctl start elasticsearch`
