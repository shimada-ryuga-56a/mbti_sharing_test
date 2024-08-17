class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :profile_id, presence: true, uniqueness: true,
                      format: { with: /\A[a-zA-Z0-9]+\z/, message: "only allows letters and numbers" },
                      length: { minimum: 5 }
  validates :username, presence: true
  validates :encrypted_password, presence: true
  validates :email, presence: true

  mount_uploader :user_image, UserImageUploader
end
