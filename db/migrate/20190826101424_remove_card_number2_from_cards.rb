class RemoveCardNumber2FromCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :card_number, :string
  end
end
