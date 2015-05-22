module Rookery
  module API
    class Ping < Grape::API

      namespace :ping do
        get do
          {ping: 'pong'}
        end
      end # namespace :ping

    end # class Ping
  end # module API
end # module Rookery
