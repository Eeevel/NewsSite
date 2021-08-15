class AddAccessMaskToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :access_mask, :integer
  end
end
