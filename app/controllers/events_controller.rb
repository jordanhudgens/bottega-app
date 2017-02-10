class EventsController < ApplicationController

  def show
     @event = Event.find(params[:id])
  end

	def new
		@event = Event.new
	end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Your event was created'}
      else
        format.html {render :new}
      end
    end
  end

  def rsvp
    EventSignup.create(user_id: current_user.id, event_id: params[:id], rsvp: params[:rsvp_status])
    redirect_to event_path(params[:id]), notice: "You have RSVP'd"
  end

	private

	  def event_params
      params.require(:event).permit(:title, :time, :description, :location)
	  end
end