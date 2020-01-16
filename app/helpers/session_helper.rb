# frozen_string_literal: true

module SessionHelper
  def logged_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.find_by(id: user_id)
  end
end
