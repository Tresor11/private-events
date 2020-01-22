# frozen_string_literal: true

class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :booked_event_id
      t.integer :event_attendee_id
      t.boolean :attending, default: false
      t.timestamps
    end
    add_foreign_key :bookings, :events, column: :booked_event_id
    add_foreign_key :bookings, :users, column: :event_attendee_id
  end
end
