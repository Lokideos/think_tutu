class SearchesController < ApplicationController

  def show    
    @chosen_trains = []

    Route.available_routes(params[:arrival_station_id], params[:departure_station_id]).each do |route|
      @chosen_trains = route.trains.flat_map { |train| train }      
    end
  end

  def new
  end
  
  private

  def search_params
    params.require(:search).permit(:arrival_station_id, :departure_station_id)
  end
end
