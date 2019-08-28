class Good < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates_uniqueness_of :item_id, scope: :user_id
  #人が１つの投稿に対して、１つしかいいねをつけられないように
end
