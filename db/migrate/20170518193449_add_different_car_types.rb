class AddDifferentCarTypes < ActiveRecord::Migration[5.0]
  def change
    remove_column :cars, :lateral_top_seats, :integer
    remove_column :cars, :lateral_bottom_seats, :integer
    remove_column :cars, :seat_places, :integer
    remove_column :cars, :in_train_index, :integer
    remove_column :cars, :car_type, :string
    remove_column :cars, :type, :string    
    add_column :cars, :side_top_seats, :integer
    add_column :cars, :side_bottom_seats, :integer
    add_column :cars, :type, :string
  end
end
