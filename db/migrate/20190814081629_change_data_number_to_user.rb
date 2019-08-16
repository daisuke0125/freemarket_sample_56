class ChangeDataNumberToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :number, :string, limit: 8
    change_column :users, :postcode, :string, limit: 8
    change_column :users, :cordNumber, :string, limit: 8
    change_column :cards, :card_number, :string, limit: 8
    change_column :cards, :exp_month, :string
    change_column :cards, :exp_year, :string
  end
end
