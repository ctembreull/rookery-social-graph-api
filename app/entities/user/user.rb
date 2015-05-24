module Rookery
  module Entity
    class User < Grape::Entity
      format_with(:iso_timestamp) { |dt| dt.iso8601 }
      format_with(:to_string_array) { |interest| interest.name }

      expose :uuid, as: :guid
      expose :email_address
      expose :display_name
      with_options(format_with: :iso_timestamp) do
        expose :created_at
        expose :updated_at
      end
      expose :profile, using: Rookery::Entity::UserProfile, if: {type: :full}
      with_options(format_with: :to_string_array) do
        expose :interests
      end
    end
  end
end
