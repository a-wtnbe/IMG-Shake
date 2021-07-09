class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy
  attachment :profile_image

  validates :name, length: {maximum: 20, minimum: 1}, uniqueness: true

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  #既にいいねしているかどうか
 def already_liked?(article)
   self.favorites.exists?(article_id: article.id)
 end

end
