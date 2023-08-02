class Users::EventsController < ApplicationController
  def index
    @hosting = EventsFacade.new.get_hosting(params[:format])
    @attending = EventsFacade.new.get_attending(params[:format])
  end

  # def new
  #   @user = params[:user_id]
  #   binding.pry
  # end

  # def create
  #   user = params[:user_id]
  #   EventsFacade.new.create_event(user, event_params)
  # end

  # private

  # def event_params
  #   params.permit(:title, :description, :street_address, :city, :state, :zipcode, :date_time, :private)
  # end
end