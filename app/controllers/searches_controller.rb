class SearchesController < ApplicationController
  def show
    @chosen_trains = []

    @chosen_trains = Route.with_stations(params[:arrival_station_id], params[:departure_station_id]).flat_map(&:trains)
  end

  def new; end

  private

  def search_params
    params.require(:search).permit(:arrival_station_id, :departure_station_id)
  end
end
