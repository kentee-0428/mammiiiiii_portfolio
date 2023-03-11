class Like < ApplicationRecord

  #アソシエーション設定
  belongs_to :user
  belongs_to :post

end
