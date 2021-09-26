class Relationship < ApplicationRecord

  #has_one_attached :image
  #validate :image_type

  #ユーザーとのリレーション
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

end
