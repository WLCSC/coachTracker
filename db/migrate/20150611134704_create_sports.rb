class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.string :name
      t.string :short
      t.date :start_date
      t.date :end_date
      t.references :role, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
