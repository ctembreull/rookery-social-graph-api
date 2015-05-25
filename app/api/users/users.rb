module Rookery
  module API
    class Users < Grape::API
      helpers Rookery::Helpers::UserHelpers

      namespace :users do

        desc 'Create a user'
        params do
          use :user_setup
        end
        post do
          # create the user
          user = Rookery::Data::User.new(email_address: params[:email_address])
          user.set_password(params[:password])
          user.display_name = params[:first_name] + ' ' + params[:last_name]
          user.save

          # create and populate the profile
          user.profile = Rookery::Data::UserProfile.create
          [:first_name, :last_name, :title, :organization, :role, :seeking].each do |k|
            user.profile[k] = params[k]
          end
          user.profile.save

          # Return JSON
          Rookery::Entity::User.represent(user, {type: :full})
        end

        desc 'Get a list of users'
        params do
          optional :page,  type: Integer, default: 1
          optional :limit, type: Integer, default: 25
        end
        get do
          users = Rookery::Data::User.all.paginate(page: params[:page], per_page: params[:limit], order: :created_at)
          Rookery::Entity::User.represent(users, {type: :limited})
        end

        route_param :user_id do
          params do
            requires :user_id, type: String
          end

          desc 'Get a user object'
          get do
            user = Rookery::Data::User.find_by(uuid: params[:user_id])
            Rookery::Entity::User.represent(user, {type: :full})
          end

          desc 'Update a user object'
          params do
            optional :email_address, type: String
          end
          put do
            user = Rookery::Data::User.find_by(uuid: params[:user_id])
            user.email_address = params[:email_address] unless params[:email_address].nil
            Rookery::Entity::User.represent(user, {type: :full})
          end

          desc 'Update a user profile'
          params do
            use :profile_fields
          end
          put :profile do
            user = Rookery::Data::User.find_by(uuid: params[:user_id])
            params[:profile].each do |f|
              user.profile[f] = params[:profile][f]
            end
            user.profile.save
            user.set_display_name # just in case the user updated their name

            Rookery::Entity::User.represent(user, {type: :full})
          end

          desc 'Update user interests'
          params do
          end
          put :interests do
          end

          desc 'Update user password'
          params do
            requires :old_password, type: String
            requires :new_password, type: String
          end
          put :password do
            user = Rookery::Data::User.find_by(uuid: params[:user_id])
            if (user.password_match?(params[:old_password]))
              user.set_password(params[:new_password])
              return { changed: { password: true } }
            else
              return { changed: { password: false, reason: 'mismatch' } }
            end
          end

          desc 'Delete a user object'
          delete do
            Rookery::Data::User.find_by(uuid: params[:user_id]).destroy

            # stub response
            { deleted: { user: true, profile: true } }
          end
        end # route_param :user_id
      end # namespace :users

    end # class Users
  end # module API
end # module Rookery
