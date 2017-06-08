class AddFioAndPersonalIdToTickets < ActiveRecord::Migration[5.0]
  def change
    change_table :tickets do |t|
      t.string :fio
      t.string :personal_id
      t.integer :departure_time
      t.integer :arrival_time
      t.string :chosen_train
    end
  end
end
