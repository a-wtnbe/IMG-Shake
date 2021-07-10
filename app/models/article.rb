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


  def self.search(search, word)
        if search == "forward_match"
                        @article = Article.where("title LIKE?","#{word}%")
        elsif search == "backward_match"
                        @article = Article.where("title LIKE?","%#{word}")
        elsif search == "perfect_match"
                        @article = Article.where("#{word}")
        elsif search == "partial_match"
                        @article = Article.where("title LIKE?","%#{word}%")
        else
                        @article = Article.all
        end
end

end
