class EventsController < ApplicationController
	before_action :set_event, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @events = Event.page(params[:page]).per(15)
  end

	def new
		@event = Event.new
	end

  def create
    @event = Event.new(event_params)

    @event.user = current_user

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Your event was created'}
      else
        format.html {render :new}
      end
    end
  end

  def edit
  end

  def destroy
  	@event.destroy
  	respond_to do |format|
  		format.html { redirect_to events_url, notice: 'Event was removed.'}
  	end
  end

	private

	  def event_params
      params.require(:event).permit(:title, :time, :description, :location, :user_id)
	  end

	  def set_event
	  	@event = Event.find(params[:id])
	  end
end