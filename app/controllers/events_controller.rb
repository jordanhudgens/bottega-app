class EventsController < ApplicationController

  def show
     @event = Event.all
  end

  private

  def event_params

  end
end
