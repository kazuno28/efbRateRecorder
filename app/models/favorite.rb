class Favorite < ApplicationRecord
  #ユーザーとのリレーション
  belongs_to :user
  #レートグラフコメントとのリレーション
  belongs_to :rate_graph_comment
  
  #バリデーション
  validates_uniqueness_of :rate_graph_comment_id, scope: :user_id
end
