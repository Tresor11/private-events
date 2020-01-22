require 'rails_helper'

RSpec.describe "Authentications", type: :request do
  describe "GET /login" do
    it "should show login page" do
      get login_path
      expect(response).to have_http_status(200)
    end

    it "should redirect existing user to user show page" do
      visit login_path
      fill_in "id", with: 2
      click_button "Login"
      current_path.should eq(user_path(2))
    end
  end
end
