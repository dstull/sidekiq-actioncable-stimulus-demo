# Sidekiq + ActionCable + Stimulus + Rails + Demo App

## OSX 
### Install
* clone repo
* `bundle install`
* `yarn`
* `brew install redis`
   * follow this guide for making redis a service: https://gist.github.com/subfuzion/9631143
* `rake db:create`
* `rake db:schema:load`
* `rake db:seed`

### Start app locally
* `foreman start`

### Testing
* install chromedriver via `brew cask install chromedriver`
* `rspec`
* `rails test:system`