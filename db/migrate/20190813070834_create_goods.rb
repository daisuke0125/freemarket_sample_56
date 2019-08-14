class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.string :text, null: false
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true 
      t.timestamps
    end
  end
end
