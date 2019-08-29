class RemoveExpMonth2FromCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :exp_month, :string
  end
end
