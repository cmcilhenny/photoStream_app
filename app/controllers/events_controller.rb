class EventsController < ApplicationController
  include EventsHelper

  before_filter :signed_in_user
  before_filter :check_event_owner, only: [:edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def create
    event = current_user.events.create event_params
  
    if event.save
      redirect_to '/events'
    else
      flash[:error] = "Something went wrong. Please enter a unique event name and custom ."
      redirect_to '/events/new'
    end
  end

  def index
    @events = current_user.events 
  end

  def show
    @event = Event.where(custom_url: params[:custom_url]).first
  end

  def destroy
    event = Event.find(params[:id])
    event.delete
    redirect_to '/events'
  end

  def edit
    @event = Event.where(custom_url: params[:custom_url]).first
  end

  def update
    event = Event.where(custom_url: params[:custom_url]).first
    event.update_attributes event_params
    redirect_to(show_event_path(event.custom_url))
  end

  private
    def event_params
      params.require(:event).permit(:name, :event_date, :user_id, :custom_url)
    end

end