class Users::PhotosController < ApplicationController
  def edit
    @user = UserFacade.new.find_user(params[:id])
  end

  def update
    require 'pry'; binding.pry
  end
end