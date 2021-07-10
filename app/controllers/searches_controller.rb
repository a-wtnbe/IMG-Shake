class SearchesController < ApplicationController
  def search
    @range = params[:range]
    search = params[:search]
    word = params[:word]
    if @range == '1'
      @user = User.search_for(search,word)
    else
      @article = Article.search(search,word)
    end
    # binding.pry
  end
end
