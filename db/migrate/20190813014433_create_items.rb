class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :image, null: false
      t.string :name, null: false
      t.text :detail, null: false
      t.references :category, foreign_key: true
      t.text :brand
      t.string :condition, null: false
      t.string :delivery, null: false
      t.string :area, null: false
      t.string :days, null: false
      t.integer :price, null: false
      t.references :user, foreign_key: true
      t.references :good, foreign_key: true
      t.references :comment, foreign_key: true
      t.timestamps
    end
  end
end
