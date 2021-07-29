class SearchesController < ApplicationController
  def search
    @range = params[:range]
    word = params[:word]
    if @range == '1'
      @user = User.search_for(word)
    else
      @article = Article.search(word)
    end
    # binding.pry
  end
end
