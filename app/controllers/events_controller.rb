class EventsController < ApplicationController
  
  def index
    @events = Event.all.order('created_at DESC')
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  private
   
  def event_params
    params.require(:event).permit(:date, :description)
  end

end
