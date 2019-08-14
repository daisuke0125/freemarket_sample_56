class AddAncestryToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :ancestry, :string
    add_index :items, :ancestry
  end
end
