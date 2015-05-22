require 'rack/cors'
require File.expand_path('../config/environment', __FILE__)

use Rack::Cors do
  @debug_mode = false
  allow do
    origins  '*'
    resource '*',
      methods: [:get, :post, :put, :delete, :options],
      headers: ['Authorization', 'Content-Type', 'Accept']
  end
end

run Rookery::App.instance
