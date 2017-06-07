class AddSeatPlaceType < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :seat_only_places, :integer
  end
end
