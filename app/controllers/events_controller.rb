class EventsController < ApplicationController
  def index
    @past = Event.all.past.order('date desc')
    @upcoming = Event.all.upcoming.order('date asc')
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
    @invitation = current_user.invitations.build
    @event = Event.find(params[:id])
    @attendee = @event.attendees
  end

  private

  def event_params
    params.require(:event).permit(:date, :description)
  end
end
