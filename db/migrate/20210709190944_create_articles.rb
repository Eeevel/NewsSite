class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :short_description
      t.text :body
      t.string :category
      t.string :region
      t.string :status
      t.boolean :important
      t.float :rating
      t.float :average_rating

      t.timestamps
    end
  end
end
