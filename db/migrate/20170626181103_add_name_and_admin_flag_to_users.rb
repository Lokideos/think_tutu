class AddNameAndAdminFlagToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_name, :string
    add_column :users, :admin, :boolean, default: false
  end
end