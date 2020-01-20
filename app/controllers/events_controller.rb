# frozen_string_literal: true

class EventsController < ApplicationController
  include SessionHelper

  def index
    @upcoming = Event.upcoming
    @past = Event.past
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to current_user
    else
      flash.now[:danger] = "Problem creating event"
      @events = current_user.created_events
      @attending = current_user.attended_events
      @event = current_user.created_events.build
      @upcoming = @attending.upcoming
      @past = @attending.past
      render 'users/show'
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    @attendees = @event.attendees
  end

  private

  def event_params
    params.require(:event).permit(:description, :title, :date)
  end
end
