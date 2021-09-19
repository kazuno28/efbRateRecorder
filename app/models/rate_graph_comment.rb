class RateGraphComment < ApplicationRecord
  #ユーザーとのリレーション
  belongs_to :user
  #レートグラフコメントとのリレーション
  belongs_to :rate_graph_commemt

  #バリデーション
  validates :rate_graph_comments, presence: true
end
