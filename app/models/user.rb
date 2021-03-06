# frozen_string_literal: true

class User < ApplicationRecord
  has_many :created_events, foreign_key: :creator_id, class_name: 'Event'
  has_many :bookings, foreign_key: :event_attendee_id
  has_many :attended_events, through: :bookings, source: :booked_event
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  valid_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # rubocop:disable Metrics/LineLength
  validates :email, presence: true, format: { with: valid_email }, uniqueness: { case_sensitive: false }
  # rubocop:enable Metrics/LineLength
  has_secure_password
end
