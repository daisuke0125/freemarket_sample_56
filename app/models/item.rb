class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :category
  belongs_to user, foreign_key: 'user_id'
  belongs_to :category

end
