module Rookery
  module API
    class UserInterests < Grape::API

      namespace :users do
        route_param :user_id do
          params do
            requires :user_id, type: String
          end
          namespace :interests do

            desc 'Retrieve a string array of interests for the given user.'
            get do
              user = Rookery::Data::User.find_by(uuid: params[:user_id])
              user.interests.map {|i| i.title} # => ['foo', 'bar', 'baz', '...']
            end

            ### COMPOSITIONAL STYLE: POST/DELETE individual interests
            ### - this requires the client to handle the differences and send (possibly many) requests,
            ### - but can be done when the interest is added, not when the page interaction is finished
            route_param :interest_id do
              params do
                requires :interest_id, type: String
              end

              post do
                # This either creates the interest or retrieves the one in the DB. Slowish.
                user     = Rookery::Data::User.find_by(uuid: params[:user_id])
                interest = Rookery::Data::Interest.find_or_create_by(name: params[:interest_id])
                Rookery::Data::InterestRelation.create(from_node: interest, to_node: user)
                # return what?
              end

              delete do
                user = Rookery::Data::User.find_by(uuid: params[:user_id])
                user.interests.find_by(name: params[:interest_id]).destroy

                # return what?
              end
            end # route_param: interest_id





          end # namespace :interests
        end # route_param :user_id
      end # namespace :users

    end # class UserInterests
  end # module API
end # module Rookery
