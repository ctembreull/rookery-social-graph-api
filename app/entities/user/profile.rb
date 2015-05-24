module Rookery
  module Entity
    class UserProfile < Grape::Entity

      expose :general do
        expose :first_name
        expose :last_name
        expose :title
        expose :organization
        expose :headline
        expose :role
        expose :seeking
        expose :about
        expose :gender
        expose :street
        expose :city
        expose :country
        expose :state
        expose :birthday
      end

      expose :communication do
        expose :phone_private
        expose :phone_work
        expose :phone_mobile
        expose :fax
        expose :skype
        expose :msn
        expose :icq
        expose :xmpp
      end

      expose :social_bookmarks do
        expose :url
        expose :linkedin
        expose :facebook
        expose :instagram
        expose :researchgate
        expose :twitter
        expose :xing
        expose :youtube
        expose :vimeo
        expose :flickr
        expose :myspace
        expose :google_plus
      end
    end
  end
end
