class GoogSeshController < ApplicationController
  def login
    client ||= Signet::OAuth2::Client.new(client_params)
    redirect_to client.authorization_uri.to_s, allow_other_host: true
  end

  def callback
    client = Signet::OAuth2::Client.new(client_params)
    client.code = params[:code]

    response = client.fetch_access_token!

    session[:authorization] = response

    redirect_to new_user_event_path(session[:user_id])
  end

  private

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
