class RemoveRatingFromArticles < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :rating, :integer
  end
end
