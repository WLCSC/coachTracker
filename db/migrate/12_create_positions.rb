class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.date :hire
      t.integer :experience, null: false
      t.float :fte, null: false
      t.references :role, index: true, foreign_key: true, null: false
      t.references :person, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
