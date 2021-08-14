class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.integer :parameter
      t.string :name
      t.integer :frequency
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
