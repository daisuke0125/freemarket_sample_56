class CreateRateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :rate_users do |t|
      t.references :user, foreign_key: true
      t.references :rate, foreign_key: true
      t.timestamps
    end
  end
end
