class AddCvcToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :cvc, :integer, null: false
  end
end
