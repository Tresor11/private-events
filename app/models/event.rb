# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendees, through: :bookings, source: :event_attendee
  has_many :bookings, foreign_key: :booked_event_id
  validates :description, presence: true, length: { minimum: 5, maximum: 140 }
  validates :date, presence: true
end
