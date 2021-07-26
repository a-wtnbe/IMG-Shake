class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to article_path(@article), notice: "You have created book successfully."
    else
      @articles = Article.all
      @user = current_user
      render 'new'
    end
  end

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def edit
    @article = Article.find(params[:id])
    if @article.user != current_user
      redirect_to articles_path
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :image, :body)
  end

end
