class ArticlesController < ApplicationController

  before_action :admin_loged_in?
  def index
    @articles = Article.all
  end

  def show 
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def admin_loged_in?
    if session[:admin].nil?
     flash[:notice]="you need to login first"
     redirect_to admin_index_url
    end
 end

 

  def edit
    @article = Article.find(params[:id])
  end

  def update

    @article=Article.find(params[:id])

    if @article.update(article_params)
      redirect_to   @article
    else
      render :edit
    end
  end

  def destroy
    @article=Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end

end
