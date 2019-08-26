class RemoveCvc2FromCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :cvc, :integer
  end
end
