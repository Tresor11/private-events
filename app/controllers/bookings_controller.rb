# frozen_string_literal: true

class BookingsController < ApplicationController
  include SessionHelper
  def new
    @booking = Booking.new
  end

  def create
    # current_user.bookings.create(booked_event_id: , attending: true)
    @event = Event.find_by(id: params[:booked_event_id])
    current_user.attended_events << @event
    current_user.bookings.where('booked_event_id = ?', params[:booked_event_id]).first.update_attributes(attending: true)
    redirect_to current_user
  end

  private
end
