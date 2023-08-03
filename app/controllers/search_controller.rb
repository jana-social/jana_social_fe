class SearchController < ApplicationController
  before_action :verify_login

  def search_dashboard
    @user = UserFacade.new.find_user(session[:user_id])
  end

  def index
  end

  def search_results
    @users = UserFacade.new.searched_users(session[:user_id], params[:radius])
  end

private

  def verify_login
    if !session[:user_id]
      redirect_to login_path
      flash[:error] = "Login to Search"
    end
  end
end


