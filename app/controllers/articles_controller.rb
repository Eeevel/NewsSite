class ArticlesController < ApplicationController
  def index
    @articles_last_updates = Article.order('updated_at DESC').limit(4)
    @articles_important = Article.where(important: true).order('updated_at DESC').limit(4)

    @articles_people = Article.where(category: 'people').order('updated_at DESC').limit(4)
    @articles_technology = Article.where(category: 'technology').order('updated_at DESC').limit(4)
    @articles_culture = Article.where(category: 'culture').order('updated_at DESC').limit(4)
    @articles_politics = Article.where(category: 'politics').order('updated_at DESC').limit(4)
    @articles_sport = Article.where(category: 'sport').order('updated_at DESC').limit(4)
    @articles_religion = Article.where(category: 'religion').order('updated_at DESC').limit(4)
    @articles_economics = Article.where(category: 'economics').order('updated_at DESC').limit(4)
    @articles_auto = Article.where(category: 'auto').order('updated_at DESC').limit(4)
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
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:title,
                                    :short_description,
                                    :body,
                                    :all_tags,
                                    :news_main_image,
                                    :category,
                                    :region,
                                    :status,
                                    :important)
  end
end
