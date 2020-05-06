# README

### For Developer  
#### Setup database
`rake db:drop db:create db:schema:load db:seed` or `rake db:setup --trace`

#### Run automatically integration tests
bundle exec guard -p

#### Setup SMTP server for development environment
`gem install mailcatcher`

`mailcatcher --foreground --ip 0.0.0.0`