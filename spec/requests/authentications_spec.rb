require 'rails_helper'

RSpec.describe 'Authentications', type: :request do
  describe 'GET /login' do
    it 'should show login page' do
      get login_path
      expect(response).to have_http_status(200)
    end

    it 'should redirect existing user to user show page' do
      user = User.create(name: 'sharmarke', email: 'ahmed@gmail.com', password: 'hey1234', password_confirmation: 'hey1234')
      visit login_path
      fill_in 'session_id', with: user.id
      click_button 'Login'
      expect(page).to have_current_path(user_path(user.id))
    end

    it 'should re-render for non-existing users' do
      visit login_path
      fill_in 'session_id', with: 5
      click_button 'Login'
      expect(page).to have_current_path(login_path)
      expect(page).to have_content('That user does not exist')
    end
  end
end
