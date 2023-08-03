class Search::UsersController < ApplicationController
  def show
    @user = UserFacade.new.find_user(params[:id])
  end

  def create
    RenderService.new.friend_status(params[:user_id], params[:friend_id], params[:status])
    flash[:message] = "Request Sent"
    redirect_to search_results_path
  end

  # def params
  #   params.permit(:friend_id, :user_id, :status)
  # end
end
