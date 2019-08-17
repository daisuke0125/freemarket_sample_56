class ChangeCordNumberToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :cordNumber, :string
  end
end
