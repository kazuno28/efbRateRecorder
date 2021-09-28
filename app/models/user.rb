class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #レートグラフとのリレーション
  has_many :rate_graphs
    #いいね・レートグラフコメントとのリレーション
    has_many :favorites, dependent: :destroy
    has_many :rate_graph_comments, dependent: :destroy

  #ActiveStorage
  has_one_attached :image
  validate :image_type

  #ユーザー名バリデーション
  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true

  # 自分がフォローされる（被フォロー）側の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 自分がフォローする（与フォロー）側の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 被フォロー関係を通じて参照→自分をフォローしている人
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # 与フォロー関係を通じて参照→自分がフォローしている人
  has_many :followings, through: :relationships, source: :followed

  #フォローするアクション
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  #フォロー外すアクション
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  #含まれているかどうか（フォローしているか）
  def following?(user)
    followings.include?(user)
  end

  #完全一致, 前方一致, 後方一致, 部分一致の検索手法
  def self.search_for(content, method)
    if method == 'perfect'
      User.where(name: content)
    elsif method == 'forward'
      User.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      User.where('name LIKE ?', '%' + content)
    else
      User.where('name LIKE ?', '%' + content + '%')
    end
  end

  private

  def image_type

    if image.record.created_at.blank?
      return
    end

    if !image.blob.content_type.in?(%('image/jpeg image/png image/jpg'))
      image.purge
      errors.add(:image, 'はJPEGまたはPNG、JPG形式を選択してアップロードしてください')
    end
  end

end
