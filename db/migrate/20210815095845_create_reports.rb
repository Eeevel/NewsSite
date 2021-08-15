class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
