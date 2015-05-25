require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end

require 'rake'

task :environment do
  ENV['RACK_ENV'] ||= 'development'
  require File.expand_path('../config/environment', __FILE__)
end

task :routes => :environment do
  Rookery::API::Core.routes.each do |api|
    method = api.route_method.ljust(10)
    path   = api.route_path
    puts "     #{method} #{path}"
  end
end

namespace :db do
  task :clean => :environment do
    Neo4j::Session.query('MATCH (n) OPTIONAL MATCH (n)-[r]-() DELETE n,r')
  end

  task :seed => :environment do
    # Load the data from the Users table
    user_file = File.read(File.expand_path('../db/users.json', __FILE__))
    json = JSON.parse(user_file)
    json.each do |user|
      puts "Seeding user: #{user['email']}"
      user = Rookery::Data::User.new(email_address: user['email'], legacy_id: user['id'], legacy_guid: user['guid'], legacy_username: user['username'])
      user.set_password('r00st3rs')
      user.save
      user.profile = Rookery::Data::UserProfile.create
    end

    # Load the data from the Profiles, table, try to match it to Users
    profile_file = File.read(File.expand_path('../db/profile.json', __FILE__))
    json         = JSON.parse(profile_file)
    json.each do |profile|
      user = Rookery::Data::User.find_by(legacy_id: profile['user_id'])
      unless user.nil?
        puts "Seeding profile for user: #{user.email_address}"
        profile.keys.each do |k|
          next if profile[k].nil?
          next unless user.profile.respond_to? k
          user.profile[k] = profile[k]
        end

        puts "Seeding tags for user: #{user.email_address}"
        unless (profile['interests'].empty? || profile['interests'].nil?)
          interest_array = profile['interests'].split(',')
          interest_array.each do |i|
            i = i.strip
            puts "TAG: #{i}"
            interest = Rookery::Data::Interest.find_or_create_by(
              tag:   Rookery::Data::Interest.title_to_tag(i)
            )
            if (interest.title.nil?)
              interest.title = i
              interest.save
            end
            user.interests << interest unless interest.nil?
          end
        end
        #TODO: interests (they're on the profile)
      end
    end
  end
end

# these probably won't work until we're using the core released gem version
# load 'neo4j/tasks/neo4j_server.rake'
# load 'neo4j/tasks/migration.rake'

task default: [:routes]
