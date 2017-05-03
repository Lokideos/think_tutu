class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :number
      t.string :car_type
      t.integer :top_seats
      t.integer :bottom_seats

      t.timestamps
    end
  end
end
