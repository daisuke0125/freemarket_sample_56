class RemoveImagesFromImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :images, :string
    add_column :images, :photo, :string
  end
end
