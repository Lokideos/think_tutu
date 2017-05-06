class AddStiCarsTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :lateral_top_seats, :integer
    add_column :cars, :lateral_bottom_seats, :integer
    add_column :cars, :seat_places, :integer
    add_column :cars, :type, :string
  end
end
