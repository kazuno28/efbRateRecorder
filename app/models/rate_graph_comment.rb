class RateGraphComment < ApplicationRecord
  #ユーザーとのリレーション
  belongs_to :user
  #いいねとのリレーション
  has_many :favorites

  #バリデーション
  validates :comment, presence: true

  def favorited_by?(current_user)
    favorites.where(user_id: current_user.id).exists?
  end
end
