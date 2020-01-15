# frozen_string_literal: true

class EventsController < ApplicationController
  def new; end

  def create
    @event = Event.new(event_params)
  end

  private

  def event_params
    params.require(:event).permit(:description, :title, :date)
  end
end
