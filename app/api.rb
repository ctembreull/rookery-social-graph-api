module Rookery
  module API
    class Core < Grape::API
      format :json

      mount ::Rookery::API::Ping

    end # class Core
  end # module API
end # module Comotion
