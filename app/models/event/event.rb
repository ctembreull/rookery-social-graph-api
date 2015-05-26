module Rookery
  module Data
    class Event
      include Neo4j::ActiveNode

      PARTICIPATION_MODE_NONE   = 0
      PARTICIPATION_MODE_INVITE = 1
      PARTICIPATION_MODE_ALL    = 2

      ATTENDANCE_MODE_NONE = 0
      ATTENDANCE_MODE_RSVP = 1
      ATTENDANCE_MODE_OPEN = 2

      has_one  :in,  :owner,         type: :owns,          model_class: 'Rookery::Data::User'
      has_one  :in,  :team,          type: :hosting,       model_class: 'Rookery::Data::Team'
      has_many :in,  :invitations,   type: :invited_to,    model_class: 'Rookery::Data::User'
      has_many :in,  :attending,     type: :attending,     model_class: 'Rookery::Data::User'
      has_many :in,  :not_attending, type: :not_attending, model_class: 'Rookery::Data::User'
      has_one  :out, :venue,         type: :located_at,    model_class: 'Rookery::Data::Location'

      property :name,                type: String
      property :description,         type: String
      property :all_day,             type: Boolean, default: false
      property :start_time,          type: DateTime
      property :end_time,            type: DateTime
      property :participation_mode,  type: Integer, default: 2
      property :attendance_mode,     type: Integer, default: 2

      validates :participation_mode, inclusion: { in: [PARTICIPATION_MODE_NONE, PARTICIPATION_MODE_INVITE, PARTICIPATION_MODE_ALL] }
      validates :attendance_mode,    inclusion: { in: [ATTENDANCE_MODE_NONE, ATTENDANCE_MODE_RSVP, ATTENDANCE_MODE_OPEN] }

    end # class Event
  end # module Data
end # module Rookery
