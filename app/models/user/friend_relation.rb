module Rookery
  module Data
    class FriendRelation

      type       'friends'
      from_class 'Rookery::Data::User'
      to_class   'Rookery::Data::User'

      # property :created_at
      # property :updated_at

      property :since,    type: DateTime
      property :token,    type: String
      property :verified, type: Boolean, default: false

      after_create do
        self.token = SecureRandom.hex(8)
      end

    end
  end
end
