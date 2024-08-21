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

  validates :username, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :profile_id, presence: true, uniqueness: true,
                      format: { with: /\A[a-zA-Z0-9]+\z/, message: "英数字のみ有効です。" },
                      length: { minimum: 5 }
  validates :mbti, inclusion: { in: MBTI_OPTIONS }, allow_blank: true

  mount_uploader :user_image, UserImageUploader

  # フォローしている関連付け
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  
  # フォローされている関連付け
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  
  # フォローしているユーザーを取得
  has_many :followings, through: :active_relationships, source: :followed
  
  # フォロワーを取得
  has_many :followers, through: :passive_relationships, source: :follower
  
  # 指定したユーザーをフォローする
  def follow(user)
    active_relationships.create(followed_id: user.id)
  end
  
  # 指定したユーザーのフォローを解除する
  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end
  
  # 指定したユーザーをフォローしているかどうかを判定
  def following?(user)
    followings.include?(user)
  end

  private

  def set_default_user_image
    if user_image.blank?
      self.user_image = File.open(Rails.root.join("app/assets/images/user_default.png"))
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["username", "profile_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["active_relationships", "followers", "followings", "passive_relationships"]
  end

end
