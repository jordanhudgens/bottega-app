class EventsController < ApplicationController

  def show
     @event = Event.find(params[:id])
  end

  def index
    @events = Event.page(params[:page]).per(15)
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

	private

	  def event_params
      params.require(:event).permit(:title, :time, :description, :location)
	  end
end
