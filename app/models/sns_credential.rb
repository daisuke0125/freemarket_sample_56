class SnsCredential < ApplicationRecord
  validates :uid, presence: true
  validates :provider, presence: true

  belongs_to :user, optional: true
  # validates_presence_of :user_id, :uid, :provider
  # #:providerと:uidのペアは一意であることを保証
  # validates_uniqueness_of :uid, uniqueness: {:scope => :provider}
end
