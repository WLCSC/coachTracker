class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, null: false
      t.references :category, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
