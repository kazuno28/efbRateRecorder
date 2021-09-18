class RateGraph < ApplicationRecord
  belongs_to :user
  
  validates :before_rate, presence: true
  validates :after_rate, presence: true
end
