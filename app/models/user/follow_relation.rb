module Rookery
  module Data
    class FriendRelation
      include Neo4j::ActiveRel

      from_class 'Rookery::Data::User'
      to_class   'Rookery::Data::User'
      type       :follows

      property :since, type: DateTime

      validates :since, presence: true

      before_save do
        since = DateTime.now.utc
      end
      
    end
  end
end
