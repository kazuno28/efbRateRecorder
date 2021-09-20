class RateGraph < ApplicationRecord

  #ユーザーとのリレーション
  belongs_to :user

  has_one_attached :image
  validate :image_type

  #試合前レート、試合後レートのバリデーション
  validates :before_rate, presence: true
  validates :after_rate, presence: true

  #グラフ
  def self.chart_date
    pluck('id', 'after_rate').to_h
  end
end
