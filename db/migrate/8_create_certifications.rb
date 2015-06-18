class CreateCertifications < ActiveRecord::Migration
  def change
    create_table :certifications do |t|
      t.references :course, index: true, foreign_key: true, null: false
      t.references :year, index: true, foreign_key: true, null: false
      t.references :person, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
