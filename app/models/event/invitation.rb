module Rookery
  module Data
    class Invitation
      include Neo4j::ActiveNode

      has_one :in,  :invited,    type: :invited,    model_class: 'Rookery::Data::User'
      has_one :in,  :invited_by, type: :invited_by, model_class: 'Rookery::Data::User'
      has_one :out, :invited_to, type: :invited_to, model_class: 'Rookery::Data::Event'

      property :created_at
      property :updated_at

    end
  end
end
