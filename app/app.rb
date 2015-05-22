module Rookery
  class App
    def initialize; end

    def self.instance
      @instance ||= Rack::Builder.new(debug: true) do
        run Rookery::App.new
      end.to_app
    end

    def call(env)
      Rookery::API::Core.call(env)
    end
  end
end
