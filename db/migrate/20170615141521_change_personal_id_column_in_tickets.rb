class ChangePersonalIdColumnInTickets < ActiveRecord::Migration[5.0]
  def change
    rename_column :tickets, :personal_id, :passport_data
  end
end
