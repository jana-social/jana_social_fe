class Users::EventsController < ApplicationController
  def index
    @hosting = EventsFacade.new.get_hosting(params[:format])
    @attending = EventsFacade.new.get_attending(params[:format])
  end
end