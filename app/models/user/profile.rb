module Rookery
  module Data
    class UserProfile
      include Neo4j::ActiveNode

      has_one :out, :user, type: :profile, model_class: 'Rookery::Data::User'

      property :first_name,   type: String
      property :last_name,    type: String
      property :title,        type: String
      property :organization, type: String
      property :headline,     type: String
      property :role,         type: String
      property :seeking,      type: String
      property :about,        type: String
      property :gender,       type: String
      property :street,       type: String
      property :city,         type: String
      property :country,      type: String
      property :state,        type: String
      property :birthday,     type: Date

      # Communication propertys
      property :phone_private, type: String
      property :phone_work,    type: String
      property :phone_mobile,  type: String
      property :fax,           type: String
      property :skype,         type: String
      property :msn,           type: String
      property :icq,           type: String
      property :xmpp,          type: String

      # Social Bookmark propertys
      property :url,           type: String
      property :linkedin,      type: String
      property :facebook,      type: String
      property :instagram,     type: String
      property :researchgate,  type: String
      property :twitter,       type: String
      property :xing,          type: String
      property :youtube,       type: String
      property :vimeo,         type: String
      property :flickr,        type: String
      property :myspace,       type: String
      property :google_plus,   type: String

      after_save do
        unless user.nil?
          user.set_display_name
          user.save
        end
      end

    end # class UserProfile
  end # module Data
end # module Rookery
