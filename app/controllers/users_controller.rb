class UsersController < ApplicationController
  def new; end

  def create
    UserFacade.new.create_user(user_params)
    flash[:success] = "Your account has been created, go ahead and log in!"
    redirect_to root_path
  end

  def show
    @user = UserFacade.new.find_user(current_user)
  end

  private

  def user_params
      params.permit(:username, :email, :password, :zipcode)
  end
end
