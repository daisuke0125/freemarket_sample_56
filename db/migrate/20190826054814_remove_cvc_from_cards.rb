class RemoveCvcFromCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :cvc, :integer
  end
end
