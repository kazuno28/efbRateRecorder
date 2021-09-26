class RateGraphComment < ApplicationRecord
  #ユーザーとのリレーション
  belongs_to :user
  #いいねとのリレーション
  has_many :favorite

  #バリデーション
  #validates :rate_graph_comment, presence: true

  #current_userによっていいねされているか？
  def favorited_by?(current_user)
    favorite.where(user_id: user.id).exists?
  end
end
