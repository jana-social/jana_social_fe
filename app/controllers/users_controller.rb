class UsersController < ApplicationController
  def show
    @user = UserFacade.new.find_user(current_user)
  end
end
