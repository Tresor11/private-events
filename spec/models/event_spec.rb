# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  before :each do
    # rubocop:disable Metrics/LineLength
    @user = User.create(name: 'tresor', email: 'treso@gmail.com', password: 'aaaaaa', password_confirmation: 'aaaaaa')
    @event = @user.created_events.create(date: '2020/12/12', description: 'thi is for testing only')
    # rubocop:enable Metrics/LineLength
  end

  context 'with valid user id' do
    it 'should create an event' do
      expect(@event).to be_valid
    end
  end
end
