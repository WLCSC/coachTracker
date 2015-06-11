class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.date :hire
      t.integer :experience
      t.float :fte
      t.references :year, index: true, foreign_key: true
      t.references :role, index: true, foreign_key: true
      t.references :person, index: true, foreign_key: true
      t.references :sport, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
