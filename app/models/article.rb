class Article < ApplicationRecord

  belongs_to :user
  attachment :image

  validates :title, presence: true
	validates :body, presence: true

  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end


  def self.search(word)
    unless word == ""
      @article = Article.where("title LIKE?","%#{word}%")
    else
      @article = Article.all
    end
  end

end
