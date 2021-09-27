class RateGraphComment < ApplicationRecord
  #ユーザーとのリレーション
  belongs_to :user
  #いいねとのリレーション
  has_many :favorite

  #バリデーション
  validates :comment, presence: true

  def favorited_by?(current_user)
    favorite.where(user_id: current_user.id).exists?
  end
end
