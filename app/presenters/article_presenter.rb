class ArticlePresenter
  def initialize(articles)
    @articles = articles
  end

  def inactive
    @articles.where(status: :inactive)
  end

  def active
    @articles.where(status: :active)
  end

  def important
    @articles.where(important: true, status: :published).limit(4)
  end

  def category(category)
    @articles.where(category: category, status: :published).limit(4)
  end

  def most_read
    @articles.where(status: :published).sort_by { |article| article.viewings.count }.reverse.first(4)
  end

  def most_commented
    @articles.where(status: :published).sort_by { |article| article.comments.count }.reverse.first(4)
  end

  def latest_updates
    @articles.where(status: :published).limit(4)
  end
end
