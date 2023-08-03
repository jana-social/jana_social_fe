class Search::UsersController < ApplicationController
  def show
    @user = UserFacade.new.find_user(params[:id])
  end
end
