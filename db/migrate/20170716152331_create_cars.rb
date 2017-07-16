class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.integer :number
      t.integer :top_seats
      t.integer :bottom_seats
      t.integer :side_top_seats
      t.integer :side_bottom_seats
      t.integer :seat_only_places
      t.belongs_to :train, index: true
      t.integer :number_in_train
      t.string :type

      t.timestamps      
    end
  end
end
