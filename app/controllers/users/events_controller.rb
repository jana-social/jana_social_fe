class Users::EventsController < ApplicationController
  def index
    @hosting = EventsFacade.new.get_hosting(params[:user_id])
    @attending = EventsFacade.new.get_attending(params[:user_id])
    session[:user_id_event] = params[:user_id]
  end

  def new
    @event = EventsFacade.new.get_one_event(params[:event_id])
    @user = params[:user_id]
  end

  def edit
    @event = EventsFacade.new.get_one_event(params[:event_id])
    @user = params[:user_id]
  end

  def update
    EventsFacade.new.update_event(params[:user_id], params[:event_id], event_params)
    redirect_to user_events_path
  end

  def create
    user = session[:user_id]
    event_object = EventsFacade.new.create_event(user, event_params)

    client = Signet::OAuth2::Client.new(client_params)
    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client
    event = Google::Apis::CalendarV3::Event.new

    event.start = params[:date_time]
    event.summary = params[:title]

    service.insert_event(event_object[:data][0][:id], event)

    redirect_to user_events_path(user)
  end

  def destroy
  end

  def show
  end

  private

  def event_params
    params.permit(:title, :description, :street_address, :city, :state, :zipcode, :date_time, :private)
  end

  def client_params
    {
      client_id: ENV["google_client_id"],
      client_secret: ENV["google_client_secret"],
      authorization_uri: "https://accounts.google.com/o/oauth2/auth",
      token_credential_uri: "https://accounts.google.com/o/oauth2/token",
      scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
      redirect_uri: "https://jana-social-fe.onrender.com/callback"
    }
  end
end
