class ArticlesController < ApplicationController
  def index
    article = Article.order('updated_at DESC').limit(4)

    @articles_last_updates = article
    @articles_important = article.where(important: true)

    @articles_people = article.where(category: 'people')
    @articles_technology = article.where(category: 'technology')
    @articles_culture = article.where(category: 'culture')
    @articles_politics = article.where(category: 'politics')
    @articles_sport = article.where(category: 'sport')
    @articles_religion = article.where(category: 'religion')
    @articles_economics = article.where(category: 'economics')
    @articles_auto = article.where(category: 'auto')
  end

  def show
    @article = Article.find(params[:id])
  end

  def people
    @articles_people = Article.order('updated_at DESC').where(category: 'people')
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
        :important
      )
  end
end
