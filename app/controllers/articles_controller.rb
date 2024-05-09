class ArticlesController < ApplicationController

  def index
    @categories = Category.all
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def  new
    @article = Article.new
  end
  
  def create
    @article = Article.new(articles_params)

    if @article.save
      redirect_to articles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    article
  end

  def entry
    article
  end

  def update
    @article = Article.find(params[:id])

    if article.update(articles_params)
      redirect_to articles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    article.destroy
   redirect_to articles_path, status: :see_other
  end
  
  

  private
  
  def articles_params
    params.require(:article).permit(:name, :note, :quantity, :category_id)
  end

  def article
    @article = Article.find(params[:id])
 end

end
