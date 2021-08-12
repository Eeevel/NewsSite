class RssFeedsController < ApplicationController
  def index
    @rss_feeds = RssFeed.order('updated_at DESC')
    authorize @rss_feeds
  end

  def show
    @rss_feed = RssFeed.find(params[:id])
    authorize @rss_feed
  end

  def new
    @rss_feed = RssFeed.new
    authorize @rss_feed
  end

  def create
    @rss_feed = RssFeed.new(rss_feed_params)
    authorize @rss_feed

    if @rss_feed.save
      redirect_to @rss_feed
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @rss_feed = RssFeed.find(params[:id])
    authorize @rss_feed
    @rss_feed.destroy

    redirect_to rss_feeds_path
  end

  private

  def rss_feed_params
    params.require(:rss_feed).permit(:title, :link)
  end
end
