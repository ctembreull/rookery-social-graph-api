$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app', 'api'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app', 'models'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app', 'helpers'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'boot'

Bundler.require :default, ENV['RACK_ENV']
application_paths = [
  '../../lib/**/*.rb',
  '../../config/initializers/*.rb',
  '../../app/models/**/*.rb',
  '../../app/helpers/**/*.rb',
  '../../app/entities/**/*.rb',
  '../../app/api/**/*.rb',
]

application_paths.each do |path|
  Dir[File.expand_path(path, __FILE__)].each do |f|
    # DEBUG: puts "Requiring #{f}"
    require f
  end
end

require 'app'
require 'api'
