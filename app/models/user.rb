class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :gender, presence: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :places, dependent: :destroy
  
  # フォロー機能
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow, dependent: :destroy
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
  has_many :followers, through: :reverses_of_relationship, source: :user, dependent: :destroy
  
  # お気に入り機能
  has_many :favorites, dependent: :destroy
  has_many :find_favorites, through: :favorites, source: :place, dependent: :destroy
  
  # 画像を表示
  mount_uploader :view, ImageUploader
  mount_uploader :image, ImageUploader
  
  
  # フォローのメソッド
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  # お気に入りのメソッド
  def like(other_place)
    self.favorites.find_or_create_by(place_id: other_place.id)
  end
  
  def unlike(other_place)
    favorite = self.favorites.find_by(place_id: other_place.id)
    favorite.destroy if favorite
  end
  
  def like?(other_place)
    self.find_favorites.include?(other_place)
  end
end
