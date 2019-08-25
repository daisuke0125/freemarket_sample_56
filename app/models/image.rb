class Image < ApplicationRecord
  belongs_to :item, optional: true,inverse_of: :images
  mount_uploader :photo, ImageUploader
end
