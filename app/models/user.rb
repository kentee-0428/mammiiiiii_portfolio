class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end

  # イメージカラムを指定
  mount_uploader :image, ImageUploader

  validates :name, presence: true, uniqueness: true, length: { maximum: 10 }, on: :update
  validates :gender, presence: true, on: :update
  validates :introduction, length: { maximum: 150 }
end
