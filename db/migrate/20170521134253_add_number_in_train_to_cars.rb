class AddNumberInTrainToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :number_in_train, :integer
  end
end
