class EventsController < ApplicationController

  def show
    # @event = Event.find(params[:id])-
  end

	def new
		@event = Event.new
	end

	private

	  def event_params

	  end
end