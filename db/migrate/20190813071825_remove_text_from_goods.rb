class RemoveTextFromGoods < ActiveRecord::Migration[5.2]
  def change
    remove_column :goods, :text, :string
  end
end
