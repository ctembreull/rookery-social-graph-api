module Rookery
  module Helpers
    module UserHelpers
      extend Grape::API::Helpers

      params :user_setup do
        # user object items
        requires :email_address, type: String, allow_blank: false
        requires :password,      type: String, allow_blank: false
        # profile object items
        requires :first_name,    type: String, allow_blank: false
        requires :last_name,     type: String, allow_blank: false
        requires :title,         type: String, allow_blank: false
        requires :organization,  type: String, allow_blank: false
        requires :role,          type: String, allow_blank: false
        requires :seeking,       type: String, allow_blank: false
      end # params :user_setup

      params :profile_fields do
        requires :profile, type: Hash do
          optional :first_name,    type: String, allow_blank: false
          optional :last_name,     type: String, allow_blank: false
          optional :title,         type: String, allow_blank: true
          optional :organization,  type: String, allow_blank: true
          optional :headline,      type: String, allow_blank: false
          optional :role,          type: String, allow_blank: false
          optional :seeking,       type: String, allow_blank: false
          optional :about,         type: String, allow_blank: true
          optional :gender,        type: String, allow_blank: true
          optional :street,        type: String, allow_blank: true
          optional :city,          type: String, allow_blank: true
          optional :country,       type: String, allow_blank: true
          optional :state,         type: String, allow_blank: true
          optional :birthday,      type: Date,   allow_blank: true
          optional :phone_private, type: String, allow_blank: true
          optional :phone_work,    type: String, allow_blank: true
          optional :phone_mobile,  type: String, allow_blank: true
          optional :fax,           type: String, allow_blank: true
          optional :skype,         type: String, allow_blank: true
          optional :msn,           type: String, allow_blank: true
          optional :icq,           type: String, allow_blank: true
          optional :xmpp,          type: String, allow_blank: true
          optional :url,           type: String, allow_blank: true
          optional :linkedin,      type: String, allow_blank: true
          optional :facebook,      type: String, allow_blank: true
          optional :instagram,     type: String, allow_blank: true
          optional :researchgate,  type: String, allow_blank: true
          optional :twitter,       type: String, allow_blank: true
          optional :xing,          type: String, allow_blank: true
          optional :youtube,       type: String, allow_blank: true
          optional :vimeo,         type: String, allow_blank: true
          optional :flickr,        type: String, allow_blank: true
          optional :myspace,       type: String, allow_blank: true
          optional :google_plus,   type: String, allow_blank: true
        end
      end # params :profile_fields

    end # module UserHelpers
  end # module Helpers
end # module Rookery
