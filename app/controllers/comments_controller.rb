class CommentsController < ApplicationController
  def create
      @article = Article.find(params[:article_id])
      #投稿に紐づいたコメントを作成
      @comment = @article.comments.build(comment_params)
      @comment.user_id = current_user.id
      @comment.save
        render :comments
  end

  def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
        render :comments
  end

  private
  def comment_params
      params.require(:comment).permit(:content, :article_id, :user_id)
  end


end
