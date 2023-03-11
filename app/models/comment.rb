class Comment < ApplicationRecord

  #アソシエーション設定
  belongs_to :user
  belongs_to :post

  validates :content, presence: true
end