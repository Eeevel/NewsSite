class CreateViewings < ActiveRecord::Migration[6.1]
  def change
    create_table :viewings do |t|
      t.boolean :view
      t.references :article, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
