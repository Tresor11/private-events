# frozen_string_literal: true

class UsersController < ApplicationController
  def index; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @events = current_user.created_events
    @attending = current_user.attended_events
    @event = current_user.created_events.build
    @upcoming = @attending.upcoming
    @past = @attending.past
  end
end

private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end
