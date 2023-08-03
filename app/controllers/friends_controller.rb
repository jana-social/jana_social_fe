class FriendsController < ApplicationController
  def index
    @friends = UserFacade.new.friends(session[:user_id])
  end
end
