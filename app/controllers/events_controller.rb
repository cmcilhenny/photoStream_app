class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    event = Event.create event_params
    if event.save
      redirect_to '/events'
    else
      flash[:error] = "That event name already exits. Please enter a unique name."
      redirect_to root_path
    end
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    event = Event.find(params[:id])
    event.delete
    redirect_to '/events'
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    event.update_attributes event_params
    redirect_to(event)
  end

  private
    def event_params
      params.require(:event).permit(:name, :event_date)
  end

end