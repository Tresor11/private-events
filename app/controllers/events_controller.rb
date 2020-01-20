# frozen_string_literal: true

class EventsController < ApplicationController
  include SessionHelper

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    @booking = current_user.bookings.create
    if @event.save
      redirect_to current_user
    else
      render :new
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
