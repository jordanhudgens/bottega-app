class EventsController < ApplicationController

  def show
     @event = Event.all
  end

	def new
		@event = Event.new
	end

	private

	  def event_params

	  end
end