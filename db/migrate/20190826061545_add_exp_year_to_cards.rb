class AddExpYearToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :exp_year, :string, null: false
  end
end
