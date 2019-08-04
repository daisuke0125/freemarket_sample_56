class RemoveAuthorFromUserss < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :nickname, :string
    remove_column :users, :name_kana, :string
  end
end
