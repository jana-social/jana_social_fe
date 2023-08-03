class Users::EventsController < ApplicationController
  def index
    @hosting = EventsFacade.new.get_hosting(params[:user_id])
    @attending = EventsFacade.new.get_attending(params[:user_id])
    session[:user_id_event] = params[:user_id]
  end

  def edit
    @event = EventsFacade.new.get_one_event(params[:event_id])
    @user = params[:user_id]
  end

  def update
    EventsFacade.new.update_event(params[:user_id], params[:event_id], event_params)
  end

  def destroy
    
  end

  private

  def event_params
    params.permit(:title, :description, :street_address, :city, :state, :zipcode, :date_time, :private)
  end
end