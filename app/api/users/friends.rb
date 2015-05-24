module Rookery
  module API
    class UserFriends < Grape::API
      namespace :users do
        route_param :user_id do
          params do
            requires :user_id, type: String
          end
          namespace :friends do

            desc 'Request a friendship with between this user and a specified user'
            params do
              requires :friend_id, type: String
            end
            post do
              user   = Rookery::Data::User.find_by(uuid: params[:user_id])
              friend = Rookery::Data::User.find_by(uuid: params[:friend_id])
              Rookery::Data::FriendRelation.create(from_node: user, to_node: friend)
            end

            desc 'Confirm (accept) a friendship request between this user and a specified user'
            params do
              requires :friend_id, type: String
              requires :token_id,  type: String
            end
            put :confirm do
            end

            desc 'Decline a friendship request between this user and a specified user'
            params do
              requires :friend_id, type: String
              requires :token_id,  type: String
            end
            put :reject do
            end

            desc 'Remove a friendship between this user and the specified user'
            params do
              requires :friend_id, type: String
            end
            delete do
            end

            desc 'Get all the friend objects for this user'
            get do
              user    = Rookery::Data::User.find_by(uuid: params[:user_id])
              friends = user.verified_friends.to_a.map {|x| x.u}
              Rookery::Entity::User.represent(friends, {type: :limited})
            end

            desc 'Get all the incoming friend requests for this user'
            get :incoming do
              user = Rookery::Data::User.find_by(uuid: params[:user_id])
              reqs = user.incoming_friend_requests.to_a.map {|x| x.u}
              Rookery::Entity::User.represent(reqs, {type: :limited})
            end

            desc 'Get all the outgoing friend requests for this user'
            get :outgoing do
              user = Rookery::Data::User.find_by(uuid: params[:user_id])
              reqs = user.outgoing_friend_requests.to_a.map {|x| x.u}
              Rookery::Entity::User.represent(reqs, {type: :limited})
            end

          end # namespace :friends
        end # route_param :user_id
      end # namespace :users
    end # class UserFriends
  end # module API
end # module Rookery
