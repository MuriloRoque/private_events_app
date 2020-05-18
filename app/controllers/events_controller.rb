class EventsController < ApplicationController
  def index
    @past = Event.created_before(Date.today).order('date desc')
    @upcoming = Event.upcoming_events(Date.today).order('date asc')
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
