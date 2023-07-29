class Api::V1::SearchController < ApplicationController

  def dashboard
  end

  def index
  end

  def create
    redirect_to api_v1_search_index_path
  end

end