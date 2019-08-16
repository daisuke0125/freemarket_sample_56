class RateUser < ApplicationRecord
  belongs_to :user
  belongs_to :rate
end
