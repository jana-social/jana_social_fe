class SearchController < ApplicationController
  before_action :verify_login

  def search_dashboard
    @user = UserFacade.new.find_user(session[:user_id])
    @latitude = params[:latitude] || session[:latitude] || Geocoder.coordinates(@user.zipcode)[0]
    @longitude = params[:longitude] || session[:longitude] || Geocoder.coordinates(@user.zipcode)[1]
    session[:latitude] = @latitude
    session[:longitude] = @longitude
  end

  def index
  end

  def search_results
    if params[:radius]
      @users = UserFacade.new.searched_users(session[:user_id], params[:radius])
      cookies[:radius] = params[:radius]
    else
      @users = UserFacade.new.searched_users(session[:user_id], cookies[:radius])
    end
  end

  private

  def verify_login
    return if session[:user_id]

    redirect_to login_path
    flash[:error] = "Login to Search"
  end
end
