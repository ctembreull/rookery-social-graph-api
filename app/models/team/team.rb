module Rookery
  module Data
    class Team
      include Neo4j::ActiveNode

      has_one  :in, :owner,     type: :owns,      model_class: 'Rookery::Data::User'
      has_many :in, :members,   type: :member_of, model_class: 'Rookery::Data::User'
      has_many :in, :interests, type: :interests, model_class: 'Rookery::Data::Interest'

      property :name,        type: String
      property :description, type: String
      property :image_url,   type: String

      validates :name, presence: true

    end # class Team
  end # module Data
end # module Rookery
