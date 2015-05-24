module Rookery
  module API
    class Core < Grape::API
      format :json

      mount ::Rookery::API::Ping
      mount ::Rookery::API::Users

    end # class Core
  end # module API
end # module Rookery
