class Item < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :category
  has_many :images, dependent: :destroy, inverse_of: :item
  accepts_nested_attributes_for :images, allow_destroy: true
  #いいね機能のアソシエーション
  has_many :goods,dependent: :destroy
  has_many :gooded_users, through: :goods, source: :user,dependent: :destroy

  validates :name, presence: true
  validates :detail, presence: true
  validates :condition, presence: true
  validates :delivery, presence: true
  validates :area, presence: true
  validates :days, presence: true
  validates :price, presence: true

  
end
