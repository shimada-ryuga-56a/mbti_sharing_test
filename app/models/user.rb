class User < ApplicationRecord
  before_save :set_default_user_image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  MBTI_OPTIONS = [
  'INTJ（建築家）', 'INTP（論理学者）', 'ENTJ（指揮官）', 'ENTP（討論者）', 
  'INFJ（提唱者）', 'INFP（仲介者）', 'ENFJ（主人公）', 'ENFP（運動家）', 
  'ISTJ（管理者）', 'ISFJ（擁護者）', 'ESTJ（幹部）', 'ESFJ（領事）',
  'ISTP（巨匠）', 'ISFP（冒険家）', 'ESFP（エンターテイナー）', 'ESTP（起業家）'
  ]

  validates :profile_id, presence: true, uniqueness: true,
                      format: { with: /\A[a-zA-Z0-9]+\z/, message: "only allows letters and numbers" },
                      length: { minimum: 5 }
  validates :username, presence: true
  validates :encrypted_password, presence: true
  validates :email, presence: true
  validates :mbti, inclusion: { in: MBTI_OPTIONS }, allow_blank: true

  mount_uploader :user_image, UserImageUploader

  private

  def set_default_user_image
    if user_image.blank?
      self.user_image = File.open(Rails.root.join("app/assets/images/user_default.png"))
    end
  end
end
