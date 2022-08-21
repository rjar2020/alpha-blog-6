class ArticlesController < ApplicationController
  def show
    #byebug for debugging purposes
    @article =  Article.find(params[:id])
  end
end
