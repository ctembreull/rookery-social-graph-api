module Rookery
  module Data
    class User
      include Neo4j::ActiveNode

      has_one  :in,   :profile,   type: :profile,   model_class: 'Rookery::Data::UserProfile', dependent: :delete
      has_many :in,   :interests, model_class: 'Rookery::Data::Interest', rel_class: 'Rookery::Data::InterestRelation'
      has_many :both, :friends,   model_class: 'Rookery::Data::User',     rel_class: 'Rookery::Data::FriendRelation'

      property :email_address, type: String, index: :exact
      property :display_name,  type: String
      property :password_salt, type: String
      property :password,      type: String
      property :last_login_at, type: DateTime
      property :legacy_id,     type: Integer
      property :legacy_guid,   type: String
      property :legacy_username, type: String
      property :created_at
      property :updated_at

      validates :email_address, presence: true, uniqueness: true
      validates :password_salt, presence: true
      validates :password,      presence: true

      def set_password(password)
        self.password_salt = BCrypt::Engine.generate_salt
        self.password      = encrypt_password(password)
      end

      def encrypt_password(password)
        BCrypt::Engine.hash_secret(password, self.password_salt)
      end

      def password_match?(password)
        return false if (self.password.nil? || self.password == '')
        return true  if encrypt_password(password) == self.password
        return false
      end

      def set_display_name
        unless self.profile.nil?
          self.display_name = self.profile.first_name + ' ' + self.profile.last_name
        end
      end

      def verified_friends
        query = "MATCH (n:`Rookery::Data::User` {uuid: '#{uuid}'})-[r]-(u) WHERE r.verified = true RETURN u, r ORDER BY r.since"
        Neo4j::Session.query(query)
      end

      def incoming_friend_requests
        query = "MATCH (n:`Rookery::Data::User` {uuid: '#{uuid}'})<-[r]-(u) WHERE r.verified = false RETURN u, r ORDER BY r.since"
        Neo4j::Session.query(query)
      end

      def outgoing_friend_requests
        query = "MATCH (n:`Rookery::Data::User` {uuid: '#{uuid}'})-[r]->(u) WHERE r.verified = false RETURN u, r ORDER BY r.since"
        Neo4j::Session.query(query)
      end

    end # class User
  end # module Data
end # module Rookery
