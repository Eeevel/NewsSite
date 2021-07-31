class ArticlesController < ApplicationController
  def index
    @articles = Article.order('updated_at DESC').limit(4)
    authorize @articles
  end

  def show
    @article = Article.find(params[:id])
    authorize @article
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    authorize @article

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
    authorize @article
  end

  def update
    @article = Article.find(params[:id])
    authorize @article

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    authorize @article
    @article.destroy

    redirect_to root_path
  end

  private

  def article_params
    params
      .require(:article)
      .permit(
        :title,
        :short_description,
        :body,
        :all_tags,
        :news_main_image,
        :category,
        :region,
        :status,
        :important,
        :access_mask
      )
  end
end
