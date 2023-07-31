class UsersController < ApplicationController
  def show
    #need to add sessions controller for login info - how to authenticate?
    @user = UserFacade.new.find_user(params[:id])
  end
end