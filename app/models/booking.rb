class Booking < ApplicationRecord
  belongs_to :booked_event, class_name: 'Event'
  belongs_to :event_attendee, class_name: 'User'
end
