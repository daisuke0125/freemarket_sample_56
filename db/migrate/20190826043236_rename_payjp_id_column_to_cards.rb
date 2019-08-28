class RenamePayjpIdColumnToCards < ActiveRecord::Migration[5.2]
  def change
    rename_column :cards, :payjp_id, :customer_id
  end
end
