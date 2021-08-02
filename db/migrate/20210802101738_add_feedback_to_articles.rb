class AddFeedbackToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :feedback, :text
  end
end
