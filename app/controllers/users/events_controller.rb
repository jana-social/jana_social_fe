class Users::EventsController < ApplicationController
  def index
    @hosting = EventsFacade.new.get_hosting(params[:user_id])
    @attending = EventsFacade.new.get_attending(params[:user_id])
    session[:user_id_event] = params[:user_id]
  end

  def new

  end

  def update
  end

  def destroy
    
  end
end