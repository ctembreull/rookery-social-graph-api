module Rookery
  module Data
    class RSVP
      include Neo4j::ActiveNode

      has_one :out, :event, type: :rsvp_to, model_class: 'Rookery::Data::Event'
      has_one :out, :user,  type: :rsvp_by, model_class: 'Rookery::Data::User'

      property :attending, type: Boolean, default: false
      property :created_at
      property :updated_at

    end
  end
end
