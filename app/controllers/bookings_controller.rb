# frozen_string_literal: true

class BookingsController < ApplicationController
  include SessionHelper
  def new
    @booking = Booking.new
  end

  def create
    event = Event.find(params[:booked_event_id])
    current_user.bookings.create(booked_event_id: event.id, attending: true)
  end

  private
end
