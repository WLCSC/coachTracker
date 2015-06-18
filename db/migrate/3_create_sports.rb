class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.string :name, null: false
      t.string :short, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.timestamps null: false
    end
  end
end
