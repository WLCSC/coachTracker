class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, null: false, index: true
      t.string :provider

      t.timestamps null: false
    end
  end
end
