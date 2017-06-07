class ChangeSortTypeFieldInTrains < ActiveRecord::Migration[5.0]
  def change
    change_column :trains, :sort_type, :boolean, default: false, null: false
  end
end
