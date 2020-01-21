# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  before :each do
    @user = User.first
    @event = @user.created_events.create(date: '2020/12/12', description: 'thi is for testing only')
  end

  context 'with valid user id' do
    it 'should create an event' do
      expect(@event).to be_valid
    end
  end
end
