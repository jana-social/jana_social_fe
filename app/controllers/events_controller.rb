class EventsController < ApplicationController
  def index
    @facade = EventsFacade.new.get_all_events
  end

  def show
    @event = EventsFacade.new.get_one_event(params[:id])
  end

  def new
    @user = params[:user_id]
  end

  private

  def event_params
    params.permit(:title, :description, :street_address, :city, :state, :zipcode, :date_time, :private)
  end
end
