class AddPayjpIdToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :payjp_id, :string
  end
end
