class CreateRssFeeds < ActiveRecord::Migration[6.1]
  def change
    create_table :rss_feeds do |t|
      t.string :title
      t.string :link

      t.timestamps
    end
  end
end
