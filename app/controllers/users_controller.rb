class UsersController < ApplicationController
  def show
    #need to add sessions controller for login info - how to authenticate?
    @user = UserFacade.new.find_user(params[:id])
  end

  def edit
    # @user = UserFacade.new.find_user(params[:id])

  end

  def update
    @user = UserFacade.new.find_user(params[:id])
    redirect_to edit_user_path(@user.id)
  end
end