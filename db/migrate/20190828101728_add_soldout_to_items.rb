class AddSoldoutToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :soldout, :string
  end
end
