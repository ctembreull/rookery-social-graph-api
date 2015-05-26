module Rookery
  module Data
    class Location
      include Neo4j::ActiveNode
      has_many :in, :events, type: :located_at, model_class: 'Rookery::Data::Event'

      property :name,      type: String
      property :address_1, type: String
      property :address_2, type: String
      property :city,      type: String
      property :state,     type: String
      property :country,   type: String
      property :postcode,  type: String
      property :geo,       type: String

    end
  end
end
