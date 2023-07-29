class Api::V1::EventsController < ApplicationController
  def index
    @facade = EventsFacade.new.get_all_events
  end
end