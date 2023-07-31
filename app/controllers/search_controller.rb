class SearchController < ApplicationController

  def dashboard
  end

  def index

  end

  def user_search
    redirect_to search_results_path
  end

  def search_results
    @users = UserFacade.new.searched_users(params[:zipcode], params[:radius])
  end

end
