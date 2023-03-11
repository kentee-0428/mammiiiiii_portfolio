class Post < ApplicationRecord

  #アソシエーション設定
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  #「ログイン中のユーザーがその投稿に対していいねをしているか」
  # def liked?(user)
  #   likes.where(user_id: user.id).exists?
  # end

  #ransack検索に使用するカラムを指定
  def self.ransackable_attributes(auth_object = nil)
    ["content"]
  end

  validates :content, presence: true
end
