source 'https://rubygems.org'

ruby '2.2.2'

# Server stack
gem 'rack'
gem 'rack-cors'
gem 'bcrypt'

# RESTful API DSL
gem 'grape'
gem 'grape-entity'
gem 'grape-swagger'

# Database
gem 'neo4j-core',  github: 'neo4jrb/neo4j-core',  branch: 'master'
gem 'active_attr', github: 'neo4jrb/active_attr', branch: 'performance'

group :development do
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-rack'
  gem 'rubocop'
  gem 'pry'
  gem 'database_cleaner'
end

group :test do
  gem 'rspec'
  gem 'rack-test'
end
