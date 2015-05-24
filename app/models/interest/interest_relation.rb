module Rookery
  module Data
    class InterestRelation
      include Neo4j::ActiveRel

      from_class 'Rookery::Data::Interest'
      to_class   :any
      type       :interests

    end
  end
end
