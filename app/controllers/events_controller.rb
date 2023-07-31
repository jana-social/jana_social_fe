class EventsController < ApplicationController
  def index
    @facade = EventsFacade.new.get_all_events
  end

  def show
    @event = EventsFacade.new.get_one_event(params[:id])
  end


end