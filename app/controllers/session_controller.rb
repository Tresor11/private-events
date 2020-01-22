# frozen_string_literal: true

class SessionController < ApplicationController
  include SessionHelper
  def new; end

  def create
    user = User.find_by(id: params[:session][:id])
    if user
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'That user does not exist'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
