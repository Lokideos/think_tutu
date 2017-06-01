class ChangeSortTypeInTrains < ActiveRecord::Migration[5.0]
  def change
    change_column :trains, :sort_type, :string
  end
end
