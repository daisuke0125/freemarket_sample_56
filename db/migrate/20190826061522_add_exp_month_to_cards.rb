class AddExpMonthToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :exp_month, :string, null: false
  end
end
