class AddDetails3ToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :nickname, false
    change_column_null :users, :name_kana, false
    
  end
end
