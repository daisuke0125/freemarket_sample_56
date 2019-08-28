class RemoveExpYear2FromCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :exp_year, :string
  end
end
