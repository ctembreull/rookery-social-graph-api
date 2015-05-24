module Rookery
  module Data
    class Interest
      include Neo4j::ActiveNode

      property  :name
      validates :name, presence: true, uniqueness: true

      has_many :out, :interested_users, model_class: 'Rookery::Data::User', relation_class: 'Rookery::Data::InterestRelation'



    end # class Interest
  end # module Data
end # module Rookery
