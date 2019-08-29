class AddCardNumberToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :card_number, :string, null: false
  end
end
