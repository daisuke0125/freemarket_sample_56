class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.string :name, null: false
      t.text :detail, null: false
      t.string :image, null: false
      t.references :user, foreign_key: true
      t.references :category
      t.text :brand
      t.string :condition, null: false
      t.string :delivery, null: false
      t.string :area, null: false
      t.string :days, null: false
      t.integer :price, null: false
      t.references :good
      t.references :comment

      t.timestamps
    end
  end
end
