class ChangeDataNumbersToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :number, :string
    change_column :users, :postcode, :string
    change_column :users, :cordNumber, :string
    change_column :cards, :card_number, :string
  end
end
