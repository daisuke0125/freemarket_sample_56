class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
