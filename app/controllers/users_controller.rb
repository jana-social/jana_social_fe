class UsersController < ApplicationController
  def new; end

  def create
    require 'pry'; binding.pry
    UserFacade.new.create_user(params[:email], params[:password])
    redirect_to root_path
  end

  def show
    @user = UserFacade.new.find_user(current_user)
  end
end
