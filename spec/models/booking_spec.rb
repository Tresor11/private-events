# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Booking, type: :model do
  before :each do
    # rubocop:disable Metrics/LineLength
    @user = User.create(name: 'tresor', email: 'treso@gmail.com', password: 'aaaaaa', password_confirmation: 'aaaaaa')
    # rubocop:enable Metrics/LineLength
    @booking = @user.bookings.create
  end

  context 'when the booked_event_id is not provided' do
    it 'it shoul not create a booking' do
      expect(@booking).to_not be_valid
    end
  end
end
