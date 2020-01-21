# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Booking, type: :model do
  before :each do
    @user = User.create(name: 'tresor', email: 'treso@gmail.com', password: 'aaaaaa', password_confirmation: 'aaaaaa')
    @booking = @user.bookings.create
  end

  context 'with valid user id' do
    it 'should create an event' do
      expect(@booking).to_not be_valid
    end
  end
end
