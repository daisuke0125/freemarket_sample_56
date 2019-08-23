class ChangeCordNumbersToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :cordNumber, :string, null: true
  end
end
