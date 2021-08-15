class RssController < ApplicationController
  layout false

  def index
    @articles = Article.order('updated_at DESC').where(status: :published).limit(20)
  end
end
