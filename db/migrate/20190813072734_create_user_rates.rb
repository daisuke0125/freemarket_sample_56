class CreateUserRates < ActiveRecord::Migration[5.2]
  def change
    create_table :user_rates do |t|
      t.references :rate, null: false,foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
