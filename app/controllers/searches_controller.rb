class SearchesController < ApplicationController    

  def show
  end

  def new    
  end

  def edit    
  end

  private

  def search_params
    params.require(:search).permit(:arrival_station_id, :departure_station_id)
  end

end
