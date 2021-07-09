class FavoritesController < ApplicationController
  # before_action :article_params
  # def create
  #   favorite = current_user.favorites.new(article_params_id: @article.id)
  #   favorite.save
  # end

  # def destroy
  #   @favorite = Favorite.find_by(user_id: current_user.id, article_id: @article.id).destroy
  # end

  # private
  # def article_params
  #   @article = Article.find(params[:article_id])
  # end

  before_action :authenticate_user!
  before_action :set_article


  def create
    @article = Article.find(params[:article_id])
    @favorite = current_user.favorites.new(article_id: @article.id)
    @favorite.save
    # binding.pry
    # redirect_to request.referer
  end

  def destroy
    @article = Article.find(params[:article_id])
    @favorite = current_user.favorites.find_by(article_id: @article.id)
    @favorite.destroy
    # redirect_to request.referer
  end

  private
  def set_article
   @article = Article.find(params[:article_id])
  end

end
