class CreateCertifications < ActiveRecord::Migration
  def change
    create_table :certifications do |t|
      t.references :course, index: true, foreign_key: true
      t.references :year, index: true, foreign_key: true
      t.references :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
