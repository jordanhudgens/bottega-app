class EventsController < ApplicationController

	before_action :set_event, only: [:edit, :update, :destroy]

  def show
     @event = Event.includes(:comments).find(params[:id])
     @comment = Comment.new
     @attendees = @event.users
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


  def rsvp
    EventSignup.find_or_create_by(user_id: current_user.id, event_id: params[:id], rsvp: params[:rsvp_status])
    redirect_to event_path(params[:id]), notice: "You have RSVP'd"
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'You have successfully updated the event.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
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