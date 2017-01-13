class OrderFeedback < ApplicationRecord
  validates :item101_rating, presence: true
  validates :item121_rating, presence: true
  validates :delivery_rating, presence: true
end
