module EventsHelper
  def check_event_owner
    event = current_user.events.where(:custom_url => params[:custom_url]).first
    if event.nil?
      flash[:error] = "Somthing is wrong. That's not your event."
      redirect_to events_path
    end
  end

end