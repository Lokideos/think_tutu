class AddSortFlagToTrain < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :sort_type, :boolean
  end
end
