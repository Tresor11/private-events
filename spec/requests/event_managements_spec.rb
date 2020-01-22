require 'rails_helper'

RSpec.describe 'EventManagements', type: :request do
  describe 'GET /events' do
    it 'should show past events' do
      user = User.create(name: 'sharmarke', email: 'ahmed@gmail.com', password: 'hey1234', password_confirmation: 'hey1234')
      Event.create(title: 'Funk', description: 'Style', date: Date.yesterday, creator_id: user.id)
      visit events_path
      expect(find('#past')).to have_content('Funk')
    end

    it 'should show future events' do
      user = User.create(name: 'sharmarke', email: 'ahmed@gmail.com', password: 'hey1234', password_confirmation: 'hey1234')
      Event.create(title: 'Funk', description: 'Style', date: Date.tomorrow, creator_id: user.id)
      visit events_path
      expect(find('#upcoming')).to have_content('Funk')
    end

    it 'should create events' do
      user = User.create(name: 'sharmarke', email: 'ahmed@gmail.com', password: 'hey1234', password_confirmation: 'hey1234')
      visit login_path
      fill_in 'session_id', with: user.id
      click_button 'Login'
      fill_in 'event_title', with: 'Funk'
      fill_in 'event_description', with: 'Style'
      fill_in 'event_date', with: Date.current
      click_button 'create event'
      expect(page).to have_current_path(user_path(user.id))
      expect(page).to have_content('event created successfully')
    end
  end
end
