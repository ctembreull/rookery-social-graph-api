module Rookery
  module Data
    class Interest
      include Neo4j::ActiveNode

      property  :title, type: String
      property  :tag,   type: String, index: :exact

      validates :tag, presence: true, uniqueness: true

      has_many :out, :interested_users, type: :interests, model_class: 'Rookery::Data::User'
      has_many :out, :interested_teams, type: :interests, model_class: 'Rookery::Data::Team'

      def self.title_to_tag(title)
        title.strip.downcase.tr(' ', '_')
      end

    end # class Interest
  end # module Data
end # module Rookery
