class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendees, through: :bookings, source: :event_attendee
  has_many :bookings, foreign_key: :booked_event_id
end
